package 
{
    import ObjectRenderer.*;
    import mx.containers.*;
    import mx.controls.*;

    public class ObjectRenderer extends Canvas
    {
        private var lbl:Label;

        public function ObjectRenderer()
        {
            this.lbl = new Label();
            this.lbl.text = "";
            this.lbl.width = 120;
            this.lbl.height = 16;
            this.addChild(this.lbl);
            return;
        }// end function

        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if (param1)
            {
                this.lbl.text = AbstractVideoObject(param1).name;
            }
            return;
        }// end function

    }
}
