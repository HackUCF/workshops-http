import std.string;
import std.conv;
import core.stdc.stdlib;
import vibe.d;

shared static string CHALLENGE_USER_AGENT;
shared static string CHALLENGE_USER_AGENT_FLAG;
shared static string CHALLENGE_METHOD_FLAG;
shared static string CHALLENGE_VERSION_FLAG;

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.port = 80;
  settings.errorPageHandler = toDelegate(&errorPage);

  auto router = new URLRouter;
  router.any("/", &index);

  setFlags();
	listenHTTP(settings, router);
  logInfo("User-Agent flag: " ~ CHALLENGE_USER_AGENT_FLAG);
  logInfo("Method flag: " ~ CHALLENGE_METHOD_FLAG);
  logInfo("Version flag: " ~ CHALLENGE_VERSION_FLAG);
}

void setFlags() {
  CHALLENGE_USER_AGENT = to!string(getenv("CHALLENGE_USER_AGENT"));
  CHALLENGE_USER_AGENT_FLAG = to!string(getenv("CHALLENGE_USER_AGENT_FLAG"));
  CHALLENGE_METHOD_FLAG = to!string(getenv("CHALLENGE_METHOD_FLAG"));
  CHALLENGE_VERSION_FLAG = to!string(getenv("CHALLENGE_VERSION_FLAG"));
}

void errorPage(HTTPServerRequest req, HTTPServerResponse res,
               HTTPServerErrorInfo error) {
  res.writeBody("");
}

void index(HTTPServerRequest req, HTTPServerResponse res)
{
  string[] flags;
  if (req.method == HTTPMethod.REPORT) {
    flags ~= CHALLENGE_METHOD_FLAG;
  }
  if (req.headers.get("User-Agent") == CHALLENGE_USER_AGENT) {
    flags ~= CHALLENGE_USER_AGENT_FLAG;
  }
  if (req.httpVersion == HTTPVersion.HTTP_1_0) {
    flags ~= CHALLENGE_VERSION_FLAG;
  }

  if (flags.length == 0) {
    res.statusCode = 400;
    res.writeBody("Nothing worked.\n");
    return;
  }

  string response = "Here are your flags:\n";
  foreach (string flag; flags) {
    response ~= "* " ~ flag ~ "\n";
  }
  res.writeBody(response);
}
