import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Profile Group Code

class ProfileGroup {
  static String baseUrl = 'http://34.173.95.97/api/teacher';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetProfileCall getProfileCall = GetProfileCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static CreateProfileCopyCall createProfileCopyCall = CreateProfileCopyCall();
  static DeleteProfileCall deleteProfileCall = DeleteProfileCall();
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get profile',
      apiUrl: '${ProfileGroup.baseUrl}/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? fatherName = '',
    String? dob = '',
    String? job = '',
    String? tazkiraNumber = '',
    String? schoolId = '',
    String? maritalStatus = '',
    String? gender = '',
    String? id = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "first_name": "$firstName",
  "last_name": "$lastName",
  "father_name": "$fatherName",
  "dob": "$dob",
  "job": "$job",
  "tazkira_number": "$tazkiraNumber",
  "school_id": "$schoolId",
  "marital_status": "$maritalStatus",
  "gender": "$gender"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update  profile',
      apiUrl: '${ProfileGroup.baseUrl}/profile/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateProfileCopyCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? fatherName = '',
    String? dob = '',
    String? job = '',
    String? tazkiraNumber = '',
    String? schoolId = '',
    String? maritalStatus = '',
    String? gender = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "first_name": "$firstName",
  "last_name": "$lastName",
  "father_name": "$fatherName",
  "dob": "$dob",
  "job": "$job",
  "tazkira_number": "$tazkiraNumber",
  "school_id": "$schoolId",
  "marital_status": "$maritalStatus",
  "gender": "$gender"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create  profile Copy',
      apiUrl: '${ProfileGroup.baseUrl}/profile',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProfileCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'delete profile',
      apiUrl: '${ProfileGroup.baseUrl}/profile/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Profile Group Code

/// Start education Group Code

class EducationGroup {
  static String baseUrl = 'http://34.173.95.97/api/teacher';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static UpdateEducationsCall updateEducationsCall = UpdateEducationsCall();
  static CreateEducationsCall createEducationsCall = CreateEducationsCall();
  static DeleteEducationsCall deleteEducationsCall = DeleteEducationsCall();
}

class UpdateEducationsCall {
  Future<ApiCallResponse> call({
    String? level = '',
    String? center = '',
    String? location = '',
    String? graduationYear = '',
    int? schoolId,
    int? userId,
    String? id = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "level": "$level",
  "center": "$center",
  "location": "$location",
  "graduation_year": "$graduationYear",
  "school_id": $schoolId,
  "user_id": $userId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update educations',
      apiUrl: '${EducationGroup.baseUrl}/educations/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateEducationsCall {
  Future<ApiCallResponse> call({
    String? level = '',
    String? center = '',
    String? location = '',
    String? graduationYear = '',
    int? schoolId,
    int? userId,
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "level": "$level",
  "center": "$center",
  "location": "$location",
  "graduation_year": "$graduationYear",
  "school_id": $schoolId,
  "user_id": $userId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create educations ',
      apiUrl: '${EducationGroup.baseUrl}/educations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteEducationsCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'delete educations',
      apiUrl: '${EducationGroup.baseUrl}/educations/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End education Group Code

/// Start Auth Group Code

class AuthGroup {
  static String baseUrl = 'http://34.173.95.97/api';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static LogOutCall logOutCall = LogOutCall();
  static RejestarCall rejestarCall = RejestarCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "$username",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${AuthGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.authorization.token''',
      ));
  String? roles(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.roles[:].name''',
      ));
  List<String>? permissions(dynamic response) => (getJsonField(
        response,
        r'''$.user.roles[:].permissions[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LogOutCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Log out',
      apiUrl: '${AuthGroup.baseUrl}/logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RejestarCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? confirmPassword = '',
    String? name = '',
    int? schoolId,
    String? role = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "$username",
  "password": "$password",
  "confirm_password": "$confirmPassword",
  "name": "$name",
  "school_id": $schoolId,
  "role": "$role"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rejestar',
      apiUrl: '${AuthGroup.baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Auth Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
