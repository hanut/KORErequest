package com.koresoft {
	
	import flash.events.*
	import flash.net.*;
	import flash.utils.Dictionary;
	import flash.system.System;
	
	public class KORErequest {
		
		private var loader:URLLoader;
		public var url:String;
		private var urlVars:Dictionary;
		private var done:Boolean;
		public var responseData:String;
		
		public function KORErequest() {
			// constructor code
			urlVars = new Dictionary();
			done = false;
		}
		
		public function makeRequest():void
		{
			try
			{
				//Set done as false initially
				done = false;
				
				//Add the urlVars to the request String
				var urlString:String = "";
				for(var key in urlVars)
				{
					urlString += key+"="+urlVars[key]+"&";
				}
				urlString +="appid="+"X1_oia9s9@)#)ipasd";
				
				//Add the URL variables to the URLVariables object
				var urlObj:URLVariables = new URLVariables(urlString); 
				//trace(urlObj);
				
				//Init a new URLRequest and setup the URLRequest
				var date:Date = new Date();
				var urlReq:URLRequest = new URLRequest(url+"?timestamp="+date.date+" "+date.time);
				
				urlReq.method = URLRequestMethod.POST; 
				urlReq.data = urlObj;
				
				// Add the URLRequest data to a new Loader
				loader = new URLLoader (urlReq); 
 
    			// Set a listener function to run when completed
    			loader.addEventListener(Event.COMPLETE, getResponse); 
				
    			// Set the loader format to variables and post to the PHP
    			loader.dataFormat = URLLoaderDataFormat.TEXT; 
				
				//Load the request
    			loader.load(urlReq);
			}
			catch(x:Error)
			{
				//trace(x.toString());
			}
		}
		
		public function addURLVars(key:String, val:String):void
		{
			urlVars[key] = val;
			//trace(key+":"+urlVars[key]);
		}
		
		private function getResponse(e:Event):void
		{
			////trace("getting response");
			done = true;
			responseData = (loader.data);
			////trace(loader.data);
			loader.close();
			e.target.removeEventListener(Event.COMPLETE, getResponse); 
		}
		
		public function isDone():Boolean
		{
			return done;
		}

	}
	
}
