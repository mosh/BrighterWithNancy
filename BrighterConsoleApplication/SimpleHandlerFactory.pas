namespace BrighterConsoleApplication;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Common.Logging,
  paramore.brighter.commandprocessor;

type
  SimpleHandlerFactory = public class(IAmAHandlerFactory)
  private
    _logger:ILog;
  protected
  public
    constructor(logger:ILog);
    method Create(handlerType:&Type):IHandleRequests;
    method Release(Handler:IHandleRequests);
  end;

implementation
constructor SimpleHandlerFactory(logger: Common.Logging.ILog);
begin
  _logger := logger;
end;

method SimpleHandlerFactory.Create(handlerType: &Type):IHandleRequests;
begin
  exit new GreetingCommandHandler(_logger);
end;

method SimpleHandlerFactory.Release(Handler: IHandleRequests);
begin

end;

end.
