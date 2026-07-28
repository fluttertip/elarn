import 'package:flutter/foundation.dart';
import 'ai_tutor_models.dart';
import 'gemini_service.dart';

class AiTutorController extends ChangeNotifier {
  AiTutorController({required this.service, required this.apiKey}) {
    _initialState();
  }

  final GeminiService service;
  final String? apiKey;

  AiTutorState _state = const AiTutorState();
  AiTutorState get state => _state;
  bool _isBusy = false;

  void _initialState() {
    _state = _state.copyWith(
      status: apiKey == null || apiKey!.trim().isEmpty
          ? AiTutorStatus.unavailable
          : AiTutorStatus.idle,
      errorMessage: apiKey == null || apiKey!.trim().isEmpty
          ? 'The AI tutor is unavailable because no API key is configured.'
          : null,
    );
  }

  Future<void> sendMessage(String message, {String? lessonId, String? courseId, String? lessonTitle, String? lessonSummary}) async {
    final trimmed = message.trim();
    if (trimmed.isEmpty || _isBusy) {
      return;
    }

    final userMessage = AiTutorMessage.user(trimmed);
    final nextMessages = [..._state.messages, userMessage];
    _isBusy = true;
    _state = _state.copyWith(
      messages: nextMessages,
      isTyping: true,
      status: AiTutorStatus.loading,
      errorMessage: null,
    );
    notifyListeners();

    final request = AiTutorRequest(
      message: trimmed,
      lessonId: lessonId,
      courseId: courseId,
      lessonTitle: lessonTitle,
      lessonSummary: lessonSummary,
    );

    final result = await service.sendPrompt(request, apiKey: apiKey);
    _isBusy = false;

    switch (result.status) {
      case AiTutorServiceStatus.success:
        _state = _state.copyWith(
          messages: [
            ...nextMessages,
            AiTutorMessage.assistant(result.reply),
          ],
          isTyping: false,
          status: AiTutorStatus.ready,
          errorMessage: null,
        );
        break;
      case AiTutorServiceStatus.missingApiKey:
        _state = _state.copyWith(
          messages: [
            ...nextMessages,
            AiTutorMessage.assistant(result.message ?? 'The AI tutor is unavailable right now.'),
          ],
          isTyping: false,
          status: AiTutorStatus.unavailable,
          errorMessage: result.message,
        );
        break;
      case AiTutorServiceStatus.timeout:
      case AiTutorServiceStatus.requestFailed:
        _state = _state.copyWith(
          messages: [
            ...nextMessages,
            AiTutorMessage.assistant(result.message ?? 'The AI tutor could not complete the request.'),
          ],
          isTyping: false,
          status: AiTutorStatus.unavailable,
          errorMessage: result.message,
        );
        break;
    }

    notifyListeners();
  }
}
