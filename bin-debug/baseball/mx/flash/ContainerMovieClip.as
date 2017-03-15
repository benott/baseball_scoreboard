package mx.flash
{
    import flash.display.*;
    import flash.events.*;
    import mx.core.*;

    dynamic public class ContainerMovieClip extends UIMovieClip
    {
        private var _contentHolder:Object;
        private var _content:IUIComponent;

        public function ContainerMovieClip()
        {
            return;
        }// end function

        public function set content(param1:IUIComponent) : void
        {
            if (contentHolderObj)
            {
                contentHolderObj.content = param1;
            }
            else
            {
                _content = param1;
            }
            return;
        }// end function

        protected function get contentHolderObj() : FlexContentHolder
        {
            var _loc_1:* = 0;
            var _loc_2:* = null;
            if (_contentHolder === undefined)
            {
                _loc_1 = 0;
                while (_loc_1 < numChildren)
                {
                    
                    _loc_2 = getChildAt(_loc_1) as FlexContentHolder;
                    if (_loc_2)
                    {
                        _contentHolder = _loc_2;
                        break;
                    }
                    _loc_1++;
                }
            }
            return _contentHolder;
        }// end function

        public function get content() : IUIComponent
        {
            return contentHolderObj ? (contentHolderObj.content) : (_content);
        }// end function

        override protected function focusInHandler(event:FocusEvent) : void
        {
            return;
        }// end function

        override protected function findFocusCandidates(param1:DisplayObjectContainer) : void
        {
            return;
        }// end function

    }
}
