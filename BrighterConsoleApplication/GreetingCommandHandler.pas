namespace BrighterConsoleApplication;

interface

uses
  Common.Logging,
  paramore.brighter.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  GreetingCommandHandler = public class(RequestHandler<GreetingCommand>)
  private
  protected
  public
    constructor (logger:ILog);

    method Handle(command:GreetingCommand):GreetingCommand;override;

  end;

implementation

constructor GreetingCommandHandler(logger: Common.Logging.ILog);
begin
  inherited constructor(logger);
end;

method GreetingCommandHandler.Handle(command: GreetingCommand):GreetingCommand;
begin
  Console.WriteLine("Hello {0}", command.Name);
  exit command;
end;

end.
