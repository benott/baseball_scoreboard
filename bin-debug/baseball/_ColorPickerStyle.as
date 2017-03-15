package 
{
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _ColorPickerStyle extends Object
    {

        public function _ColorPickerStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration("ColorPicker");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("ColorPicker", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.iconColor = 0;
                this.fontSize = 11;
                this.verticalGap = 0;
                this.shadowColor = 5068126;
                this.skin = ColorPickerSkin;
                this.swatchBorderSize = 0;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
