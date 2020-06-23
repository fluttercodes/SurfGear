import 'package:mwwm_github_client/model/common/network/auth_network_client.dart';

class AuthRepository {
  AuthRepository(this._networkClient);

  final AuthNetworkClient _networkClient;

  Future<bool> auth() => _networkClient.auth();

  Future<String> getToken() => _networkClient.getToken();

  Future<bool> isUserAuth() async => _networkClient.isUserAuth();
}
