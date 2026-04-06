import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginWithEmailAndPassword({required String emailAddress,required String password})async{
    emit(AuthLoadingState());
    final response = await AuthRepo.loginWithEmailAndPassword(emailAddress: emailAddress, password: password);

    if(response is UserCredential){
      emit(AuthSuccessState());
    }else{
      emit(AuthErrorState());
    }
  }

  Future<void> signInWithGoogle()async{
    emit(AuthLoadingState());
    final response = await AuthRepo.signInWithGoogle();

    if(response is UserCredential){
      emit(AuthSuccessState());
    }else{
      emit(AuthErrorState());
    }
  }
}
