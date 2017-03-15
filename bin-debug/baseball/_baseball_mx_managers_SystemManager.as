package 
{
    import _baseball_mx_managers_SystemManager.*;
    import flash.system.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.managers.*;

    public class _baseball_mx_managers_SystemManager extends SystemManager implements IFlexModuleFactory
    {
        private var _preloadedRSLs:Dictionary;

        public function _baseball_mx_managers_SystemManager()
        {
            FlexVersion.compatibilityVersionString = "3.0.0";
            return;
        }// end function

        override public function create(... args) : Object
        {
            if (args.length > 0 && !(args[0] is String))
            {
                return super.create.apply(this, args);
            }
            args = args.length == 0 ? ("baseball") : (String(args[0]));
            var _loc_3:* = Class(getDefinitionByName(args));
            if (!_loc_3)
            {
                return null;
            }
            var _loc_4:* = new _loc_3;
            if (new _loc_3 is IFlexModule)
            {
                IFlexModule(_loc_4).moduleFactory = this;
            }
            return _loc_4;
        }// end function

        override public function allowInsecureDomain(... args) : void
        {
            args = null;
            Security.allowInsecureDomain(args);
            for (args in this._preloadedRSLs)
            {
                
                if (args.content && "allowInsecureDomainInRSL" in args.content)
                {
                    var _loc_5:* = args.content;
                    _loc_5["allowInsecureDomainInRSL"](args);
                }
            }
            return;
        }// end function

        override public function info() : Object
        {
            return {applicationComplete:"applicationComplete()", compiledLocales:["en_US"], compiledResourceBundleNames:["SharedResources", "collections", "containers", "controls", "core", "effects", "formatters", "skins", "styles"], currentDomain:ApplicationDomain.currentDomain, height:"600", horizontalScrollPolicy:"off", layout:"absolute", mainClassName:"baseball", mixins:["_baseball_FlexInit", "_alertButtonStyleStyle", "_headerDateTextStyle", "_macMinButtonStyle", "_winCloseButtonStyle", "_SwatchPanelStyle", "_WindowStyle", "_todayStyleStyle", "_windowStylesStyle", "_TextInputStyle", "_dateFieldPopupStyle", "_winMinButtonStyle", "_dataGridStylesStyle", "_headerDragProxyStyleStyle", "_popUpMenuStyle", "_HSliderStyle", "_DragManagerStyle", "_windowStatusStyle", "_ContainerStyle", "_swatchPanelTextFieldStyle", "_textAreaHScrollBarStyleStyle", "_macCloseButtonStyle", "_comboDropdownStyle", "_winMaxButtonStyle", "_ButtonStyle", "_linkButtonStyleStyle", "_richTextEditorTextAreaStyleStyle", "_ControlBarStyle", "_textAreaVScrollBarStyleStyle", "_globalStyle", "_HTMLStyle", "_ListBaseStyle", "_AlertStyle", "_ApplicationStyle", "_ToolTipStyle", "_WindowedApplicationStyle", "_winRestoreButtonStyle", "_CursorManagerStyle", "_opaquePanelStyle", "_errorTipStyle", "_activeTabStyleStyle", "_PanelStyle", "_statusTextStyleStyle", "_ScrollBarStyle", "_macMaxButtonStyle", "_plainStyle", "_activeButtonStyleStyle", "_advancedDataGridStylesStyle", "_titleTextStyleStyle", "_gripperSkinStyle", "_ColorPickerStyle", "_weekDayStyleStyle", "_baseballWatcherSetupUtil"], verticalScrollPolicy:"off", width:"800"};
        }// end function

        override public function get preloadedRSLs() : Dictionary
        {
            if (this._preloadedRSLs == null)
            {
                this._preloadedRSLs = new Dictionary(true);
            }
            return this._preloadedRSLs;
        }// end function

        override public function allowDomain(... args) : void
        {
            args = null;
            Security.allowDomain(args);
            for (args in this._preloadedRSLs)
            {
                
                if (args.content && "allowDomainInRSL" in args.content)
                {
                    var _loc_5:* = args.content;
                    _loc_5["allowDomainInRSL"](args);
                }
            }
            return;
        }// end function

    }
}
