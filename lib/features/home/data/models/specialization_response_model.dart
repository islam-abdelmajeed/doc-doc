import 'package:json_annotation/json_annotation.dart';

part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name: 'data')
  List<SpecializationData?>? specializationData;

  SpecializationResponseModel({this.specializationData});
  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) => _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationData {
  int? id;
  String? name;
  @JsonKey(name: 'doctors')
  List<Doctor?>? doctorsList;

  SpecializationData({this.id, this.name, this.doctorsList});
  factory SpecializationData.fromJson(Map<String, dynamic> json) => _$SpecializationDataFromJson(json);
}

@JsonSerializable()
class Doctor {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? degree;
  @JsonKey(name: 'appoint_price')
  int? price;

  Doctor({this.id, this.name, this.email, this.phone, this.photo, this.gender, this.degree, this.price});
  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}
