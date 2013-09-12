package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.display.MovieClip;
	import flash.net.*;
	import fl.controls.Button;
	import com.koresoft.KORErequest;
	
	
	public class test2 extends MovieClip{
		private var myReq:KORErequest;
		
		public function test2() {
			testBtn.addEventListener(MouseEvent.CLICK, sendMsg);
		}


		private function sendMsg(e:Event):void
		{
			try
			{
				//get a new Kore Request object
				myReq = new KORErequest();
				
				//Set the url
				myReq.url = "http://localhost/juaa_server/server.php";
				
				//Add the data
				myReq.addURLVars("username","adi");
				myReq.addURLVars("password","123");
				
				//Add a listener to listen for completion of request
				this.addEventListener(Event.ENTER_FRAME, fillBox);
				
				//Make the request
				myReq.makeRequest();
			}
			catch(x:Error)
			{
				trace(x.toString());
			}
		}
		
		private function fillBox(e:Event):void
		{
			if(myReq.isDone())
			{
				testBtn.addEventListener(MouseEvent.CLICK, sendMsg);
				testBtn.enabled = true;
				
				//fill response box with result
				responseBox.text = myReq.responseData;
				
				//Check the response from server
				//responseBox.text = (myReq.responseData.toString());
				this.removeEventListener(Event.ENTER_FRAME, fillBox);
			}
		}
	
	}
}


