abstract class Config {
  const Config({
    required this.urlGateway,
    this.apiKey = '16b97f7ab797d291a388295fce182de8',
  });

  factory Config.load() {
    return const _DevConfig();
  }

  final String urlGateway;
  final String apiKey;
}

class _DevConfig extends Config {
  const _DevConfig()
      : super(
          urlGateway: 'https://api.themoviedb.org/3',
        );
}
