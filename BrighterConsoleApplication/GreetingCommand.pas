namespace BrighterConsoleApplication;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  paramore.brighter.commandprocessor;

type

  GreetingCommand = public class(IRequest)
  private
  protected
  public
    constructor(_name:String);
    property Id:Guid;
    property Name:String read private write;
  end;

implementation

constructor GreetingCommand(_name: String);
begin
  self.Name := _name;
end;

end.
