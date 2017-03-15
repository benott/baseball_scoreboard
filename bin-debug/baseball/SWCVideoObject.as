package 
{
    import SWCVideoObject.*;
    import mx.flash.*;

    public class SWCVideoObject extends AbstractVideoObject
    {
        private var _class:Class;
        private var _object:UIMovieClip;

        public function SWCVideoObject(param1:String, param2:Class)
        {
            this._class = param2;
            super(param1);
            return;
        }// end function

        override public function stop() : void
        {
            if (this._object)
            {
                this._object.stop();
            }
            this._object = null;
            return;
        }// end function

        override public function play() : void
        {
            this._object = new this._class();
            this.addChild(this._object);
            this._object.play();
            return;
        }// end function

    }
}
