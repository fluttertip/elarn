import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ai_tutor_models.dart';

class GeminiService {
  GeminiService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static const _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';

  Future<AiTutorServiceResult> sendPrompt(AiTutorRequest request, {String? apiKey}) async {
    final key = apiKey?.trim();
    if (key == null || key.isEmpty) {
      return const AiTutorServiceResult(
        status: AiTutorServiceStatus.missingApiKey,
        reply: '',
        message: 'The AI tutor is unavailable because no API key is configured.',
      );
    }

    try {
      final uri = Uri.parse('$_baseUrl?key=$key');
      final payload = {
        'contents': [
          {
            'parts': [
              {
                'text': _buildPrompt(request),
              }
            ]
          }
        ]
      };

      final response = await _client.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      ).timeout(const Duration(seconds: 20));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        return const AiTutorServiceResult(
          status: AiTutorServiceStatus.requestFailed,
          reply: '',
          message: 'The AI tutor could not complete the request.',
        );
      }

      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      final candidates = decoded['candidates'] as List<dynamic>?;
      final firstCandidate = candidates?.isNotEmpty == true ? candidates!.first as Map<String, dynamic>? : null;
      final content = firstCandidate?['content'] as Map<String, dynamic>?;
      final parts = content?['parts'] as List<dynamic>?;
      final text = parts?.isNotEmpty == true ? parts!.first['text'] as String? : null;

      if (text == null || text.trim().isEmpty) {
        return const AiTutorServiceResult(
          status: AiTutorServiceStatus.requestFailed,
          reply: '',
          message: 'The AI tutor returned an empty response.',
        );
      }

      return AiTutorServiceResult(
        status: AiTutorServiceStatus.success,
        reply: text.trim(),
      );
    } on TimeoutException {
      return const AiTutorServiceResult(
        status: AiTutorServiceStatus.timeout,
        reply: '',
        message: 'The AI tutor request timed out.',
      );
    } on FormatException {
      return const AiTutorServiceResult(
        status: AiTutorServiceStatus.requestFailed,
        reply: '',
        message: 'The AI tutor returned an unexpected response.',
      );
    } catch (_) {
      return const AiTutorServiceResult(
        status: AiTutorServiceStatus.requestFailed,
        reply: '',
        message: 'The AI tutor could not complete the request.',
      );
    }
  }

  String _buildPrompt(AiTutorRequest request) {
    final buffer = StringBuffer();
    buffer.write('You are an encouraging study tutor for an educational app. ');
    buffer.write('Answer briefly and clearly. ');
    if (request.lessonTitle != null && request.lessonTitle!.isNotEmpty) {
      buffer.write('Lesson: ${request.lessonTitle}. ');
    }
    if (request.lessonSummary != null && request.lessonSummary!.isNotEmpty) {
      buffer.write('Context: ${request.lessonSummary}. ');
    }
    if (request.courseId != null && request.courseId!.isNotEmpty) {
      buffer.write('Course id: ${request.courseId}. ');
    }
    buffer.write('User request: ${request.message}');
    return buffer.toString();
  }
}
