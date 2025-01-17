class GeminiModel {
  List<Candidates>? candidates;
  UsageMetadata? usageMetadata;
  String? modelVersion;

  GeminiModel({this.candidates, this.usageMetadata, this.modelVersion});

  GeminiModel.fromJson(Map<String, dynamic> json) {
    if (json['candidates'] != null) {
      candidates = <Candidates>[];
      json['candidates'].forEach((v) {
        candidates!.add(new Candidates.fromJson(v));
      });
    }
    usageMetadata = json['usageMetadata'] != null
        ? new UsageMetadata.fromJson(json['usageMetadata'])
        : null;
    modelVersion = json['modelVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.candidates != null) {
      data['candidates'] = this.candidates!.map((v) => v.toJson()).toList();
    }
    if (this.usageMetadata != null) {
      data['usageMetadata'] = this.usageMetadata!.toJson();
    }
    data['modelVersion'] = this.modelVersion;
    return data;
  }
}

class Candidates {
  Content? content;
  String? finishReason;
  CitationMetadata? citationMetadata;
  double? avgLogprobs;

  Candidates(
      {this.content,
      this.finishReason,
      this.citationMetadata,
      this.avgLogprobs});

  Candidates.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    finishReason = json['finishReason'];
    citationMetadata = json['citationMetadata'] != null
        ? new CitationMetadata.fromJson(json['citationMetadata'])
        : null;
    avgLogprobs = json['avgLogprobs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['finishReason'] = this.finishReason;
    if (this.citationMetadata != null) {
      data['citationMetadata'] = this.citationMetadata!.toJson();
    }
    data['avgLogprobs'] = this.avgLogprobs;
    return data;
  }
}

class Content {
  List<Parts>? parts;
  String? role;

  Content({this.parts, this.role});

  Content.fromJson(Map<String, dynamic> json) {
    if (json['parts'] != null) {
      parts = <Parts>[];
      json['parts'].forEach((v) {
        parts!.add(new Parts.fromJson(v));
      });
    }
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parts != null) {
      data['parts'] = this.parts!.map((v) => v.toJson()).toList();
    }
    data['role'] = this.role;
    return data;
  }
}

class Parts {
  String? text;

  Parts({this.text});

  Parts.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class CitationMetadata {
  List<CitationSources>? citationSources;

  CitationMetadata({this.citationSources});

  CitationMetadata.fromJson(Map<String, dynamic> json) {
    if (json['citationSources'] != null) {
      citationSources = <CitationSources>[];
      json['citationSources'].forEach((v) {
        citationSources!.add(new CitationSources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.citationSources != null) {
      data['citationSources'] =
          this.citationSources!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CitationSources {
  int? startIndex;
  int? endIndex;
  String? uri;

  CitationSources({this.startIndex, this.endIndex, this.uri});

  CitationSources.fromJson(Map<String, dynamic> json) {
    startIndex = json['startIndex'];
    endIndex = json['endIndex'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startIndex'] = this.startIndex;
    data['endIndex'] = this.endIndex;
    data['uri'] = this.uri;
    return data;
  }
}

class UsageMetadata {
  int? promptTokenCount;
  int? candidatesTokenCount;
  int? totalTokenCount;

  UsageMetadata(
      {this.promptTokenCount, this.candidatesTokenCount, this.totalTokenCount});

  UsageMetadata.fromJson(Map<String, dynamic> json) {
    promptTokenCount = json['promptTokenCount'];
    candidatesTokenCount = json['candidatesTokenCount'];
    totalTokenCount = json['totalTokenCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promptTokenCount'] = this.promptTokenCount;
    data['candidatesTokenCount'] = this.candidatesTokenCount;
    data['totalTokenCount'] = this.totalTokenCount;
    return data;
  }
}
