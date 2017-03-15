package
{
	import mx.controls.SWFLoader;
	
	public class SWFLoaderVideoObject extends AbstractVideoObject
	{
		private var _loader:SWFLoader = new SWFLoader();
		private var _object:Object;
		
		public function SWFLoaderVideoObject(name:String, source: Object)
		{
			super(name);
			_object = source;

		}
		
		public override function play():void {
			_loader.source = _object;
            this.addChild(_loader);
		}
		
		public override function stop():void {
			_loader.source = null;
            
			this.removeAllChildren();
		}
		
		
		
	}
}