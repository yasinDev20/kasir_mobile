import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sales_summary_event.dart';
part 'sales_summary_state.dart';

class SalesSummaryBloc extends Bloc<SalesSummaryEvent, SalesSummaryState> {
  SalesSummaryBloc() : super(SalesSummaryInitial()) {
    on<SalesSummaryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
