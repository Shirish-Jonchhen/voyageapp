import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/core/api_response/api_response.dart';
import 'package:voyage/src/core/errors/app_exceptions.dart';

abstract class AuthRemoteSource {
  Future<ApiResponse<AuthResponse>> signIn(String email, String password);
  Future<ApiResponse<AuthResponse>> signUp(String email, String password, Map<String, dynamic>? data);
  Future<ApiResponse<AuthResponse>> signInWithGoogle();
  Future<ApiResponse<AuthResponse>> signInWithApple();
   // Future<void> signOut();
  // User? getCurrentUser();
}

@LazySingleton(as: AuthRemoteSource)
class AuthRemoteSourceImpl implements AuthRemoteSource{
  final SupabaseClient client = Supabase.instance.client;

  @override
  Future<ApiResponse<AuthResponse>> signIn(String email, String password) async {
    try {
      final AuthResponse response = await client.auth.signInWithPassword(
          email: email, password: password);

      if (response.user != null) {
        return ApiResponse(
          data: response,
          message: "Sign in successful",
        );

        // You can print other user details similarly
      } else {
        throw AppException(message: "Something went Wrong");
      }
    } on AuthException catch(e) {
      print('Sign in failed: $e');
      throw AppException(message: e.message);
    }
  }

  @override
  Future<ApiResponse<AuthResponse>> signUp(String email, String password, Map<String, dynamic>? data) async{
    try {
      final AuthResponse response = await client.auth.signUp(
          email: email, password: password, data: data);

      if (response.user != null) {
        return ApiResponse(
          data: response,
          message: "Sign in successful",
        );

        // You can print other user details similarly
      } else {
        throw AppException(message: "Something went Wrong");
      }
    } on AuthException catch(e) {
      print('Sign in failed: $e');
      throw AppException(message: e.message);
    }
  }

  @override
  Future<ApiResponse<AuthResponse>> signInWithGoogle() async{
    try{
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
      final String idToken = googleUser.authentication.idToken!;

      final AuthResponse response = await client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        // redirectTo: "https://xempffbmtivdhptpdeyx.supabase.co/auth/v1/callback",
      );


      if (response.user != null) {
        return ApiResponse(
          data: response,
          message: "Sign in successful",
        );

        // You can print other user details similarly
      } else {
        throw AppException(message: "Something went Wrong");
      }

    }on AuthException catch(e) {
      throw AppException(message: e.message);
    }on Exception catch(e) {
      throw AppException(message: "Something went wrong");
    }
  }

  @override
  Future<ApiResponse<AuthResponse>> signInWithApple() async{
    return ApiResponse();
    // try {
    //   final AuthResponse response = await client.auth.signInWithProvider(
    //     provider: OAuthProvider.apple,
    //     // redirectTo: "https://xempffbmtivdhptpdeyx.supabase.co/auth/v1/callback",
    //   );
    //
    //   if (response.user != null) {
    //     return ApiResponse(
    //       data: response,
    //       message: "Sign in successful",
    //     );
    //
    //     // You can print other user details similarly
    //   } else {
    //     throw AppException(message: "Something went Wrong");
    //   }
    // } on AuthException catch(e) {
    //   throw AppException(message: e.message);
    // } on Exception catch(e) {
    //   throw AppException(message: "Something went wrong");
    // }

  }
  
}

