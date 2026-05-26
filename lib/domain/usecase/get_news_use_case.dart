import '../models/news.dart';
import '../models/gateways/news_gateway.dart';

class GetNewsUseCase {
  final NewsGateway _newsGateway;

  GetNewsUseCase(this._newsGateway);

  Future<List<News>> execute() {
    return _newsGateway.getLatestNews();
  }
}
