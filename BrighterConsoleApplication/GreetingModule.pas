namespace BrighterConsoleApplication;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Nancy;

type

  GreetingModule = public class(NancyModule)
  private
  protected
  public
    constructor;
  end;

implementation

constructor GreetingModule;
begin
  inherited;
  Put['/Greeting'] := _ -> 
    begin 
      ConsoleApp.Processor.Send(new GreetingCommand("John"));
      exit Response.AsJson(new class()); 
    end;
end;

end.
