enum ServerErrorType {
  general('general'),
  unauthorized('unauthorized'),
  notFound('not_found'),
  badRequest('bad_request'),
  timeout('timeout');

  const ServerErrorType(this.value);
  final String value;
}
