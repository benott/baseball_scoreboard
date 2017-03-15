package
{
	import mx.containers.Canvas;
	import mx.controls.Label;

	public class ObjectRenderer extends Canvas
	{
		private var lbl:Label = new Label();
		
		public function ObjectRenderer()
		{
            super();
			lbl.text = "";
			lbl.width = 120;
			lbl.height = 16;
			this.addChild(lbl);

		}
		
		public override function set data(value:Object):void {
			super.data = value;
			if(value) {
				lbl.text = AbstractVideoObject(value).name;
			
			}
		}
		
	}
}