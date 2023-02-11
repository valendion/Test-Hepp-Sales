import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_happ_sales/domain/contact.dart';

class ContactRepository {
  Future<Either<List<Contact>, Failure>> postContact() async {
    try {
      var response = await Dio(BaseOptions(headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6InNhaSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL3VwbiI6IkhBUFBTQUxFU0RFViIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcHJpbWFyeXNpZCI6IjE2MTEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ByaW1hcnlncm91cHNpZCI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiI2MmM4OTIxYi1lOWQyLTU0OTMtYjhjZC0xNjhlMWVjZTczZGUiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2dyb3Vwc2lkIjoiMTU3YTJjY2EtMTk1NC00ZTg5LTlkMzUtYTAzYmJkNzEzNjNkIiwianRpIjoiYTBiNDZkNWMtMDFlMy00OGU4LTlmZTQtNDI4OTEyZWMzZTQ1IiwiZXhwIjoxNzA3MTAzNjkxLCJpc3MiOiJoYXBwc2FsZXMuY29tIiwiYXVkIjoiaGFwcHNhbGVzLmNvbSJ9.d4L4bEIz1lvpFW_4BmwL5Rwh78bKV6OfDXyoD-6QPOo"
      })).post('http://13.68.210.77:8080/api/v1/ManagerRequest/GetContactPaged',
          data: {"UserData": "1611", "SearchText": ""});
      var data =
          (response.data as List).map((e) => Contact.fromMap(e)).toList();
      return Left(data);
    } catch (e) {
      return Right(Failure(e.toString()));
    }
  }
}

class Failure {
  Failure(this.message);
  final String message;
}

final contactRepositoryProvider = Provider<ContactRepository>((ref) {
  return ContactRepository();
});
