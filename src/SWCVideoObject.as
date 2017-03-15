package
{
	import mx.flash.UIMovieClip;
	
	public class SWCVideoObject extends AbstractVideoObject
	{
		private var _object:UIMovieClip;
		private var _class: Class;
		public function SWCVideoObject(name:String, klass:Class)
		{
			_class = klass;
			super(name);
		}
		
		public override function play():void
		{
			_object = new _class();
            this.addChild(_object);
		    _object.play();
		}
		public override function stop():void {
			if(_object)
            _object.stop();
            _object = null
        }
		
		
	}
}