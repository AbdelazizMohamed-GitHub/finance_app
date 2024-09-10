import 'package:bloc/bloc.dart';
import 'package:finance_app/constnat.dart';
import 'package:finance_app/model/finance_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'add_data_state.dart';

class AddDataCubit extends Cubit<AddDataState> {
  AddDataCubit() : super(AddDataInitial());

  void addData(FinanceModel financeModel) {
   try{
    emit(AddDataLoading());
    Hive.box<FinanceModel>(kBox).add(financeModel);
    emit(AddDataSuccess());
   }
   catch(e){
     emit(AddDataFailure(error: e.toString()));
   }
  }
}
