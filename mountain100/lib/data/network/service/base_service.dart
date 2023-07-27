import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mountain100/data/model/mountain/mountain_model.dart';
import '../../model/base/base_model.dart';
import '../dio_factory.dart';
import '../failure.dart';
abstract class BaseServiceInterface{
  Future<Either<Failure,List<MountainModel>>> getMountainList({int page, int perPage});
}

final baseServiceProvider = Provider<BaseService>((ref)=>BaseService());

class BaseService with BaseServiceInterface{
  late final Dio _dio = DioFactory.getDio();

  @override
  Future<Either<Failure, List<MountainModel>>> getMountainList({int? page, int? perPage}) async {
    try{
      Map<String,dynamic> params={'serviceKey':dotenv.get("API_KEY")};
      if (page!=null){
        params['page']=page;
      }
      if(perPage!=null){
        params['perPage']=perPage;
      }
      final response = await _dio.get(
        '/',
        queryParameters: params
      );
      BaseResponse baseResponse = BaseResponse.fromJson(response.data);
      if(baseResponse.currentCount>0){
        List<MountainModel> mountainList=[];
        for(var data in baseResponse.data!){
          MountainModel fromjson = MountainModel.fromJson(data);
          mountainList.add(fromjson);
        }
        return Right(mountainList);
      }
      else{
        return Left(Failure(500, "Failed to get mauntain list."));
      }
    }
    catch(e){
      print(e.toString());
      return Left(Failure(500,"Error occurred while get mountain list."));
    }
  }
}