namespace BrighterConsoleApplication;

interface

uses
  System.Linq, 
  Microsoft.Owin.Hosting,
  Common.Logging,
  Common.Logging.Configuration,
  Common.Logging.Simple,
  paramore.brighter.commandprocessor;

type

  ConsoleApp = class
  public
    class method Main(args: array of String);
    class property Processor:CommandProcessor;
  end;

implementation

class method ConsoleApp.Main(args: array of String);
begin

  var properties := new NameValueCollection();

  properties["showDateTime"] := "true";
  LogManager.Adapter := new ConsoleOutLoggerFactoryAdapter(properties);
  var logger := LogManager.GetLogger(typeOf (ConsoleApp));

  var registry := new SubscriberRegistry();
  registry.Register<GreetingCommand,GreetingCommandHandler>;


  var builder := CommandProcessorBuilder
    .&With
    .Handlers(new HandlerConfiguration(registry, new SimpleHandlerFactory(logger)))
    .NoPolicy
    .Logger(logger)
    .NoTaskQueues
    .RequestContextFactory(new InMemoryRequestContextFactory)
    ;

  Processor := builder.Build();

  using WebApp.Start<Startup>('http://localhost:12345') do
  begin
    Console.ReadLine();
  end;

end;

end.
