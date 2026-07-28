class AiTutorMessage {
  const AiTutorMessage({
    required this.id,
    required this.isUser,
    required this.content,
    required this.timestamp,
  });

  factory AiTutorMessage.user(String content) => AiTutorMessage(
        id: 'user-${DateTime.now().microsecondsSinceEpoch}',
        isUser: true,
        content: content,
        timestamp: DateTime.now(),
      );

  factory AiTutorMessage.assistant(String content) => AiTutorMessage(
        id: 'assistant-${DateTime.now().microsecondsSinceEpoch}',
        isUser: false,
        content: content,
        timestamp: DateTime.now(),
      );

  final String id;
  final bool isUser;
  final String content;
  final DateTime timestamp;
}

enum AiTutorStatus { idle, loading, ready, unavailable }

enum AiTutorServiceStatus { success, missingApiKey, timeout, requestFailed }

class AiTutorState {
  const AiTutorState({
    this.messages = const [],
    this.isTyping = false,
    this.status = AiTutorStatus.idle,
    this.errorMessage,
    this.promptSuggestions = const [
      'Explain this lesson',
      'Summarize the key ideas',
      'Give me a quick practice question',
    ],
  });

  final List<AiTutorMessage> messages;
  final bool isTyping;
  final AiTutorStatus status;
  final String? errorMessage;
  final List<String> promptSuggestions;

  AiTutorState copyWith({
    List<AiTutorMessage>? messages,
    bool? isTyping,
    AiTutorStatus? status,
    String? errorMessage,
    List<String>? promptSuggestions,
  }) {
    return AiTutorState(
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
      status: status ?? this.status,
      errorMessage: errorMessage,
      promptSuggestions: promptSuggestions ?? this.promptSuggestions,
    );
  }
}

class AiTutorRequest {
  const AiTutorRequest({
    required this.message,
    this.lessonId,
    this.courseId,
    this.lessonTitle,
    this.lessonSummary,
  });

  final String message;
  final String? lessonId;
  final String? courseId;
  final String? lessonTitle;
  final String? lessonSummary;
}

class AiTutorServiceResult {
  const AiTutorServiceResult({
    required this.status,
    required this.reply,
    this.message,
  });

  final AiTutorServiceStatus status;
  final String reply;
  final String? message;
}
