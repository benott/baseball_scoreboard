package 
{
    import _DragManagerStyle.*;
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _DragManagerStyle extends Object
    {
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragReject_80669050:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragReject_80669050;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragCopy_1419725564:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragCopy_1419725564;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragLink_1419463275:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragLink_1419463275;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragMove_1419503120:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragMove_1419503120;

        public function _DragManagerStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration("DragManager");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("DragManager", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.copyCursor = _embed_css_Assets_swf_mx_skins_cursor_DragCopy_1419725564;
                this.moveCursor = _embed_css_Assets_swf_mx_skins_cursor_DragMove_1419503120;
                this.rejectCursor = _embed_css_Assets_swf_mx_skins_cursor_DragReject_80669050;
                this.linkCursor = _embed_css_Assets_swf_mx_skins_cursor_DragLink_1419463275;
                this.defaultDragImageSkin = DefaultDragImage;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
