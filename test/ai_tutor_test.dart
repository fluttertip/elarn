import 'package:flutter_test/flutter_test.dart';
import 'package:elearningapp/features/ai_tutor/ai_controller.dart';
import 'package:elearningapp/features/ai_tutor/ai_tutor_models.dart';
import 'package:elearningapp/features/ai_tutor/gemini_service.dart';

class FakeGeminiService extends GeminiService {
  FakeGeminiService(this.result);

  final AiTutorServiceResult result;

  @override
  Future<AiTutorServiceResult> sendPrompt(AiTutorRequest request, {String? apiKey}) async {
    return result;
  }
}

void main() {
  test('controller appends assistant reply when the service succeeds', () async {
    final controller = AiTutorController(
      service: FakeGeminiService(const AiTutorServiceResult(
        status: AiTutorServiceStatus.success,
        reply: 'Keep practicing.',
      )),
      apiKey: 'demo-key',
    );

    await controller.sendMessage('Help me study');

    expect(controller.state.messages.length, 2);
    expect(controller.state.messages.first.content, 'Help me study');
    expect(controller.state.messages.last.content, 'Keep practicing.');
    expect(controller.state.status, AiTutorStatus.ready);
  });

  test('controller surfaces a missing API key state', () async {
    final controller = AiTutorController(
      service: FakeGeminiService(const AiTutorServiceResult(
        status: AiTutorServiceStatus.missingApiKey,
        reply: '',
        message: 'No API key configured.',
      )),
      apiKey: null,
    );

    await controller.sendMessage('Need help');

    expect(controller.state.status, AiTutorStatus.unavailable);
    expect(controller.state.errorMessage, 'No API key configured.');
  });
}
