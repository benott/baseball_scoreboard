package 
{
    import baseball.*;
    import com.keaura.controls.*;
    import flash.desktop.*;
    import flash.display.*;
    import flash.events.*;
    import flash.filesystem.*;
    import flash.net.*;
    import flash.ui.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.collections.*;
    import mx.containers.*;
    import mx.controls.*;
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;

    public class baseball extends WindowedApplication implements IBindingClient
    {
        private var _1638580657textcolorpicker3:ColorPicker;
        private var _1589021819foregroundCanvas:Canvas;
        private var _1989825379textcolor3:uint = 16448250;
        private var currentFg:AbstractVideoObject;
        private var scroller:ScrollingText;
        var _bindingsByDestination:Object;
        private var _877022220text07:TextInput;
        private var _701492296loadButton:Button;
        private var _1694761857special06:TextInput;
        private var _1694761861special02:TextInput;
        private var _896071476speed3:int = 2;
        protected var fileLoad:FileReference;
        private var _877022194text12:TextInput;
        private var _1927615352scrollbackgroundcolor:uint = 0;
        private var _877022225text02:TextInput;
        private var _389253294scrolldirection:String = "-";
        private var _2987369ad06:TextInput;
        private var _877022188text18:TextInput;
        private var _1989825380textcolor2:uint = 16448250;
        private var _2987372ad09:TextInput;
        private var _877022219text08:TextInput;
        private var _962590849direction:String = "-";
        private var _3552059tab0:Button;
        private var _1694761854special09:TextInput;
        private var _1034019242textcolor:uint = 16448250;
        private var _2987394ad10:TextInput;
        private var _3283fy:int = 400;
        private var _2987368ad05:TextInput;
        protected var fileSave:FileReference;
        private var _1006804125others:Canvas;
        private var _2083803546scrollspeed:int = 2;
        private var _2987371ad08:TextInput;
        private var _877022193text13:TextInput;
        private var _877022165text20:TextInput;
        private var _3282fx:int = 184;
        private var _877022224text03:TextInput;
        private var _1694761832special10:TextInput;
        private var _877022187text19:TextInput;
        private var _1694761858special05:TextInput;
        private var _877022218text09:TextInput;
        private var _1694761862special01:TextInput;
        private var _2132674595backgroundcolor2:uint = 0;
        public var _baseball_Button10:Button;
        public var _baseball_Button11:Button;
        public var _baseball_Button12:Button;
        public var _baseball_Button13:Button;
        public var _baseball_Button15:Button;
        public var _baseball_Button16:Button;
        public var _baseball_Button17:Button;
        public var _baseball_Button18:Button;
        public var _baseball_Button19:Button;
        public var _baseball_Button14:Button;
        private var _3552061tab2:Button;
        private var _2987367ad04:TextInput;
        public var _baseball_Button21:Button;
        public var _baseball_Button22:Button;
        public var _baseball_Button23:Button;
        public var _baseball_Button24:Button;
        public var _baseball_Button25:Button;
        public var _baseball_Button26:Button;
        public var _baseball_Button20:Button;
        public var _baseball_Button28:Button;
        public var _baseball_Button29:Button;
        public var _baseball_Button27:Button;
        private var _2987370ad07:TextInput;
        private var _358460208backgroundcolorpicker3:ColorPicker;
        private var _1316677365backgroundcolor:uint = 0;
        public var _baseball_Button34:Button;
        public var _baseball_Button35:Button;
        public var _baseball_Button36:Button;
        public var _baseball_Button37:Button;
        public var _baseball_Button38:Button;
        public var _baseball_Button39:Button;
        var _bindingsBeginWithWord:Object;
        private var _1235362755backgroundcolorpicker:ColorPicker;
        public var _baseball_Button41:Button;
        public var _baseball_Button42:Button;
        public var _baseball_Button43:Button;
        public var _baseball_Button40:Button;
        public var _baseball_Button49:Button;
        private var _460681687scrolltextcolor:uint = 16448250;
        public var _baseball_Button50:Button;
        public var _baseball_Button53:Button;
        public var _baseball_Button54:Button;
        public var _baseball_Button55:Button;
        public var _baseball_Button56:Button;
        public var _baseball_Button57:Button;
        public var _baseball_Button58:Button;
        private var _3552060tab1:Button;
        private var _1638580658textcolorpicker2:ColorPicker;
        private var _877022223text04:TextInput;
        private var _224454804direction3:String = "<";
        private var _2987366ad03:TextInput;
        public var _baseball_Button52:Button;
        private var _877022192text14:TextInput;
        private var _1694761855special08:TextInput;
        public var _baseball_Button51:Button;
        private var _1992520092textcolorpicker:ColorPicker;
        private var _1462923831canvasHold:Canvas;
        private var _899647327slide2:HSlider;
        private var _128069115advertisement:Canvas;
        private var _2987365ad02:TextInput;
        private var _1694761859special04:TextInput;
        private var _241352577buttons:Canvas;
        private var _877022191text15:TextInput;
        private var _1872831239availableList:List;
        private var _877022222text05:TextInput;
        private var _358460209backgroundcolorpicker2:ColorPicker;
        private var _877022196text10:TextInput;
        private var _2987364ad01:TextInput;
        private var _899647326slide3:HSlider;
        private var _109641799speed:int = 2;
        private var _1694761856special07:TextInput;
        private var _1694761860special03:TextInput;
        private var _1002924213textlist:Canvas;
        private var _224454803direction2:String = "<";
        private var _2132674594backgroundcolor3:uint = 0;
        private var _1066602621objectList:ArrayCollection;
        private var _877022190text16:TextInput;
        protected var filter:FileFilter;
        private var _877022221text06:TextInput;
        var _watchers:Array;
        private var _986234315mouseHider:Canvas;
        private var _896071477speed2:int = 2;
        private var _109526449slide:HSlider;
        private var _584254223saveButton:Button;
        private var _877022195text11:TextInput;
        private var _877022226text01:TextInput;
        var _bindings:Array;
        private var _877022189text17:TextInput;
        private var _documentDescriptor_:UIComponentDescriptor;
        private static var _watcherSetupUtil:IWatcherSetupUtil;
        static var _baseball_StylesInit_done:Boolean = false;

        public function baseball()
        {
            this._documentDescriptor_ = new UIComponentDescriptor({type:WindowedApplication, propertiesFactory:function () : Object
            {
                return {width:800, height:600, childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                {
                    return {width:798, height:598, horizontalScrollPolicy:"off", verticalScrollPolicy:"off", childDescriptors:[new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                    {
                        return {width:150, childDescriptors:[new UIComponentDescriptor({type:Canvas, propertiesFactory:function () : Object
                        {
                            return {height:90, width:150, childDescriptors:[new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button1_click"}, propertiesFactory:function () : Object
                            {
                                return {label:" Up", width:60, x:45, y:15, height:18};
                            }// end function
                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button2_click"}, propertiesFactory:function () : Object
                            {
                                return {label:" Down", width:60, x:45, y:65, height:18};
                            }// end function
                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button3_click"}, propertiesFactory:function () : Object
                            {
                                return {label:" Left", width:60, x:10, y:40, height:18};
                            }// end function
                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button4_click"}, propertiesFactory:function () : Object
                            {
                                return {label:" Right", width:60, x:80, y:40, height:18};
                            }// end function
                            })]};
                        }// end function
                        }), new UIComponentDescriptor({type:Spacer, propertiesFactory:function () : Object
                        {
                            return {height:6};
                        }// end function
                        }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button5_click"}, propertiesFactory:function () : Object
                        {
                            return {label:"v     Load     v", width:150, height:18};
                        }// end function
                        }), new UIComponentDescriptor({type:List, id:"availableList", events:{doubleClick:"__availableList_doubleClick"}, propertiesFactory:function () : Object
                        {
                            return {percentWidth:100, height:400, itemRenderer:_baseball_ClassFactory1_c(), doubleClickEnabled:true};
                        }// end function
                        }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button6_click"}, propertiesFactory:function () : Object
                        {
                            return {label:"<-    Blank    ->", width:150, toolTip:"Clear all animations", height:18};
                        }// end function
                        })]};
                    }// end function
                    }), new UIComponentDescriptor({type:Canvas, id:"canvasHold", propertiesFactory:function () : Object
                    {
                        return {width:640, height:560, horizontalScrollPolicy:"off", verticalScrollPolicy:"off", childDescriptors:[new UIComponentDescriptor({type:Canvas, id:"buttons", propertiesFactory:function () : Object
                        {
                            return {width:500, height:40, x:40, y:5, childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                            {
                                return {childDescriptors:[new UIComponentDescriptor({type:Button, id:"tab0", events:{click:"__tab0_click"}, propertiesFactory:function () : Object
                                {
                                    return {width:80, label:"Spieler", enabled:false};
                                }// end function
                                }), new UIComponentDescriptor({type:Button, id:"tab1", events:{click:"__tab1_click"}, propertiesFactory:function () : Object
                                {
                                    return {width:80, label:"Werbung"};
                                }// end function
                                }), new UIComponentDescriptor({type:Button, id:"tab2", events:{click:"__tab2_click"}, propertiesFactory:function () : Object
                                {
                                    return {width:80, label:"Sonstiges"};
                                }// end function
                                })]};
                            }// end function
                            })]};
                        }// end function
                        }), new UIComponentDescriptor({type:Canvas, id:"textlist", stylesFactory:function () : void
                        {
                            this.backgroundAlpha = 0.1;
                            this.backgroundColor = 0;
                            return;
                        }// end function
                        , propertiesFactory:function () : Object
                        {
                            return {width:600, height:320, x:0, y:50, childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                            {
                                return {childDescriptors:[new UIComponentDescriptor({type:VBox, stylesFactory:function () : void
                                {
                                    this.left = "10";
                                    this.top = "10";
                                    this.verticalAlign = "middle";
                                    this.horizontalAlign = "center";
                                    return;
                                }// end function
                                , propertiesFactory:function () : Object
                                {
                                    return {childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {height:320, width:410, childDescriptors:[new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                        {
                                            return {width:200, height:300, childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text01", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button10", events:{click:"___baseball_Button10_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text02", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button11", events:{click:"___baseball_Button11_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text03", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button12", events:{click:"___baseball_Button12_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text04", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button13", events:{click:"___baseball_Button13_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text05", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button14", events:{click:"___baseball_Button14_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text06", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button15", events:{click:"___baseball_Button15_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text07", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button16", events:{click:"___baseball_Button16_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text08", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button17", events:{click:"___baseball_Button17_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text09", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button18", events:{click:"___baseball_Button18_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text10", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button19", events:{click:"___baseball_Button19_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            })]};
                                        }// end function
                                        }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                        {
                                            return {width:200, height:300, childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text11", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button20", events:{click:"___baseball_Button20_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text12", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button21", events:{click:"___baseball_Button21_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text13", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button22", events:{click:"___baseball_Button22_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text14", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button23", events:{click:"___baseball_Button23_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text15", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button24", events:{click:"___baseball_Button24_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text16", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button25", events:{click:"___baseball_Button25_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text17", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button26", events:{click:"___baseball_Button26_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text18", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button27", events:{click:"___baseball_Button27_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text19", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button28", events:{click:"___baseball_Button28_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                            {
                                                return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"text20", propertiesFactory:function () : Object
                                                {
                                                    return {width:160};
                                                }// end function
                                                }), new UIComponentDescriptor({type:Button, id:"_baseball_Button29", events:{click:"___baseball_Button29_click"}, stylesFactory:function () : void
                                                {
                                                    this.paddingLeft = 2;
                                                    return;
                                                }// end function
                                                , propertiesFactory:function () : Object
                                                {
                                                    return {width:28, tabEnabled:false};
                                                }// end function
                                                })]};
                                            }// end function
                                            })]};
                                        }// end function
                                        })]};
                                    }// end function
                                    })]};
                                }// end function
                                }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                {
                                    return {width:160, childDescriptors:[new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:ColorPicker, id:"textcolorpicker", events:{change:"__textcolorpicker_change", doubleClick:"__textcolorpicker_doubleClick"}, propertiesFactory:function () : Object
                                        {
                                            return {labelField:"T", toolTip:"textcolor", doubleClickEnabled:true};
                                        }// end function
                                        }), new UIComponentDescriptor({type:ColorPicker, id:"backgroundcolorpicker", events:{change:"__backgroundcolorpicker_change", doubleClick:"__backgroundcolorpicker_doubleClick"}, propertiesFactory:function () : Object
                                        {
                                            return {toolTip:"backgroundcolor", doubleClickEnabled:true};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:Label, propertiesFactory:function () : Object
                                        {
                                            return {text:"direction"};
                                        }// end function
                                        }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                        {
                                            return {childDescriptors:[new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button30_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"<", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button31_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"-", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button32_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"^", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button33_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"v", toolTip:"direction"};
                                            }// end function
                                            })]};
                                        }// end function
                                        }), new UIComponentDescriptor({type:HSlider, id:"slide", events:{change:"__slide_change"}, stylesFactory:function () : void
                                        {
                                            this.dataTipPrecision = 0;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:150, minimum:1, maximum:5, snapInterval:1, tickInterval:1, toolTip:"speed"};
                                        }// end function
                                        })]};
                                    }// end function
                                    })]};
                                }// end function
                                })]};
                            }// end function
                            })]};
                        }// end function
                        }), new UIComponentDescriptor({type:Canvas, id:"advertisement", stylesFactory:function () : void
                        {
                            this.backgroundAlpha = 0.1;
                            this.backgroundColor = 0;
                            return;
                        }// end function
                        , propertiesFactory:function () : Object
                        {
                            return {visible:false, width:700, height:330, x:40, y:50, childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                            {
                                return {childDescriptors:[new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                {
                                    return {width:340, height:300, childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad01", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button34", events:{click:"___baseball_Button34_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad02", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button35", events:{click:"___baseball_Button35_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad03", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button36", events:{click:"___baseball_Button36_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad04", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button37", events:{click:"___baseball_Button37_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad05", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button38", events:{click:"___baseball_Button38_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad06", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button39", events:{click:"___baseball_Button39_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad07", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button40", events:{click:"___baseball_Button40_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad08", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button41", events:{click:"___baseball_Button41_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad09", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button42", events:{click:"___baseball_Button42_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"ad10", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button43", events:{click:"___baseball_Button43_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    })]};
                                }// end function
                                }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                {
                                    return {width:200, childDescriptors:[new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:ColorPicker, id:"textcolorpicker2", events:{change:"__textcolorpicker2_change", doubleClick:"__textcolorpicker2_doubleClick"}, propertiesFactory:function () : Object
                                        {
                                            return {labelField:"T", toolTip:"textcolor", doubleClickEnabled:true};
                                        }// end function
                                        }), new UIComponentDescriptor({type:ColorPicker, id:"backgroundcolorpicker2", events:{change:"__backgroundcolorpicker2_change", doubleClick:"__backgroundcolorpicker2_doubleClick"}, propertiesFactory:function () : Object
                                        {
                                            return {toolTip:"backgroundcolor", doubleClickEnabled:true};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:Label, propertiesFactory:function () : Object
                                        {
                                            return {text:"direction"};
                                        }// end function
                                        }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                        {
                                            return {childDescriptors:[new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button44_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"<", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button45_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"-", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button46_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"^", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button47_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"v", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button48_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"*", toolTip:"direction"};
                                            }// end function
                                            })]};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HSlider, id:"slide2", events:{change:"__slide2_change"}, stylesFactory:function () : void
                                    {
                                        this.dataTipPrecision = 0;
                                        return;
                                    }// end function
                                    , propertiesFactory:function () : Object
                                    {
                                        return {width:150, minimum:1, maximum:5, snapInterval:1, tickInterval:1, toolTip:"speed"};
                                    }// end function
                                    })]};
                                }// end function
                                })]};
                            }// end function
                            })]};
                        }// end function
                        }), new UIComponentDescriptor({type:Canvas, id:"others", stylesFactory:function () : void
                        {
                            this.backgroundAlpha = 0.1;
                            this.backgroundColor = 0;
                            return;
                        }// end function
                        , propertiesFactory:function () : Object
                        {
                            return {visible:false, width:700, height:330, x:40, y:50, childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                            {
                                return {childDescriptors:[new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                {
                                    return {width:340, height:300, childDescriptors:[new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special01", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button49", events:{click:"___baseball_Button49_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special02", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button50", events:{click:"___baseball_Button50_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special03", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button51", events:{click:"___baseball_Button51_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special04", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button52", events:{click:"___baseball_Button52_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special05", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button53", events:{click:"___baseball_Button53_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special06", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button54", events:{click:"___baseball_Button54_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special07", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button55", events:{click:"___baseball_Button55_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special08", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button56", events:{click:"___baseball_Button56_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special09", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button57", events:{click:"___baseball_Button57_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:TextInput, id:"special10", propertiesFactory:function () : Object
                                        {
                                            return {width:260};
                                        }// end function
                                        }), new UIComponentDescriptor({type:Button, id:"_baseball_Button58", events:{click:"___baseball_Button58_click"}, stylesFactory:function () : void
                                        {
                                            this.paddingLeft = 2;
                                            return;
                                        }// end function
                                        , propertiesFactory:function () : Object
                                        {
                                            return {width:28, tabEnabled:false};
                                        }// end function
                                        })]};
                                    }// end function
                                    })]};
                                }// end function
                                }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                {
                                    return {width:200, childDescriptors:[new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:ColorPicker, id:"textcolorpicker3", events:{change:"__textcolorpicker3_change", doubleClick:"__textcolorpicker3_doubleClick"}, propertiesFactory:function () : Object
                                        {
                                            return {labelField:"T", toolTip:"textcolor", doubleClickEnabled:true};
                                        }// end function
                                        }), new UIComponentDescriptor({type:ColorPicker, id:"backgroundcolorpicker3", events:{change:"__backgroundcolorpicker3_change", doubleClick:"__backgroundcolorpicker3_doubleClick"}, propertiesFactory:function () : Object
                                        {
                                            return {toolTip:"backgroundcolor", doubleClickEnabled:true};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                    {
                                        return {childDescriptors:[new UIComponentDescriptor({type:Label, propertiesFactory:function () : Object
                                        {
                                            return {text:"direction"};
                                        }// end function
                                        }), new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                                        {
                                            return {childDescriptors:[new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button59_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"<", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button60_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"-", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button61_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"^", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button62_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"v", toolTip:"direction"};
                                            }// end function
                                            }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button63_click"}, propertiesFactory:function () : Object
                                            {
                                                return {label:"*", toolTip:"direction"};
                                            }// end function
                                            })]};
                                        }// end function
                                        })]};
                                    }// end function
                                    }), new UIComponentDescriptor({type:HSlider, id:"slide3", events:{change:"__slide3_change"}, stylesFactory:function () : void
                                    {
                                        this.dataTipPrecision = 0;
                                        return;
                                    }// end function
                                    , propertiesFactory:function () : Object
                                    {
                                        return {width:150, minimum:1, maximum:5, snapInterval:1, tickInterval:1, toolTip:"speed"};
                                    }// end function
                                    })]};
                                }// end function
                                })]};
                            }// end function
                            })]};
                        }// end function
                        })]};
                    }// end function
                    })]};
                }// end function
                }), new UIComponentDescriptor({type:Canvas, stylesFactory:function () : void
                {
                    this.right = "2";
                    this.bottom = "2";
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {includeInLayout:false, width:90, height:100, childDescriptors:[new UIComponentDescriptor({type:VBox, propertiesFactory:function () : Object
                    {
                        return {childDescriptors:[new UIComponentDescriptor({type:Button, id:"saveButton", propertiesFactory:function () : Object
                        {
                            return {width:70, label:"Save"};
                        }// end function
                        }), new UIComponentDescriptor({type:Button, id:"loadButton", propertiesFactory:function () : Object
                        {
                            return {width:70, label:"Load"};
                        }// end function
                        }), new UIComponentDescriptor({type:Spacer, propertiesFactory:function () : Object
                        {
                            return {height:10};
                        }// end function
                        }), new UIComponentDescriptor({type:Button, events:{click:"___baseball_Button66_click"}, propertiesFactory:function () : Object
                        {
                            return {label:"EXIT", width:70};
                        }// end function
                        })]};
                    }// end function
                    })]};
                }// end function
                }), new UIComponentDescriptor({type:Canvas, id:"mouseHider", events:{mouseOver:"__mouseHider_mouseOver", mouseOut:"__mouseHider_mouseOut"}, stylesFactory:function () : void
                {
                    this.backgroundColor = 3355443;
                    this.backgroundAlpha = 0.5;
                    this.borderStyle = "solid";
                    this.borderThickness = 0;
                    this.borderColor = 11141120;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {width:353, height:96, includeInLayout:false};
                }// end function
                }), new UIComponentDescriptor({type:Canvas, id:"foregroundCanvas", stylesFactory:function () : void
                {
                    this.backgroundColor = 0;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {width:288, height:32, includeInLayout:false, horizontalScrollPolicy:"off", verticalScrollPolicy:"off", mouseChildren:false, mouseEnabled:false, horizontalScrollPosition:0};
                }// end function
                }), new UIComponentDescriptor({type:Canvas, stylesFactory:function () : void
                {
                    this.backgroundAlpha = 0;
                    this.borderColor = 0;
                    this.borderStyle = "solid";
                    this.borderThickness = 1;
                    return;
                }// end function
                , propertiesFactory:function () : Object
                {
                    return {x:0, y:0, width:800, height:600};
                }// end function
                })]};
            }// end function
            });
            this._1066602621objectList = new ArrayCollection();
            this.currentFg = new AbstractVideoObject("NULL");
            this.filter = new FileFilter("Scoreboard", "*.scoreboard", "SCOREBOARD;");
            this.fileSave = new FileReference();
            this.fileLoad = new FileReference();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            .mx_internal::_baseball_StylesInit();
            this.layout = "absolute";
            this.width = 800;
            this.height = 600;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("applicationComplete", this.___baseball_WindowedApplication1_applicationComplete);
            return;
        }// end function

        public function ___baseball_Button62_click(event:MouseEvent) : void
        {
            this.direction3 = "v";
            return;
        }// end function

        public function get text06() : TextInput
        {
            return this._877022221text06;
        }// end function

        public function ___baseball_Button45_click(event:MouseEvent) : void
        {
            this.direction2 = "-";
            return;
        }// end function

        public function get text12() : TextInput
        {
            return this._877022194text12;
        }// end function

        public function get text13() : TextInput
        {
            return this._877022193text13;
        }// end function

        public function ___baseball_Button28_click(event:MouseEvent) : void
        {
            this.loadText(this.text19);
            return;
        }// end function

        public function get text16() : TextInput
        {
            return this._877022190text16;
        }// end function

        public function get text10() : TextInput
        {
            return this._877022196text10;
        }// end function

        public function get text11() : TextInput
        {
            return this._877022195text11;
        }// end function

        public function set text10(param1:TextInput) : void
        {
            var _loc_2:* = this._877022196text10;
            if (_loc_2 !== param1)
            {
                this._877022196text10 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text10", _loc_2, param1));
            }
            return;
        }// end function

        public function set advertisement(param1:Canvas) : void
        {
            var _loc_2:* = this._128069115advertisement;
            if (_loc_2 !== param1)
            {
                this._128069115advertisement = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "advertisement", _loc_2, param1));
            }
            return;
        }// end function

        public function get text18() : TextInput
        {
            return this._877022188text18;
        }// end function

        public function set text12(param1:TextInput) : void
        {
            var _loc_2:* = this._877022194text12;
            if (_loc_2 !== param1)
            {
                this._877022194text12 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text12", _loc_2, param1));
            }
            return;
        }// end function

        public function get text08() : TextInput
        {
            return this._877022219text08;
        }// end function

        public function set text13(param1:TextInput) : void
        {
            var _loc_2:* = this._877022193text13;
            if (_loc_2 !== param1)
            {
                this._877022193text13 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text13", _loc_2, param1));
            }
            return;
        }// end function

        public function set text17(param1:TextInput) : void
        {
            var _loc_2:* = this._877022189text17;
            if (_loc_2 !== param1)
            {
                this._877022189text17 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text17", _loc_2, param1));
            }
            return;
        }// end function

        public function set text14(param1:TextInput) : void
        {
            var _loc_2:* = this._877022192text14;
            if (_loc_2 !== param1)
            {
                this._877022192text14 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text14", _loc_2, param1));
            }
            return;
        }// end function

        public function set text11(param1:TextInput) : void
        {
            var _loc_2:* = this._877022195text11;
            if (_loc_2 !== param1)
            {
                this._877022195text11 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text11", _loc_2, param1));
            }
            return;
        }// end function

        public function set text19(param1:TextInput) : void
        {
            var _loc_2:* = this._877022187text19;
            if (_loc_2 !== param1)
            {
                this._877022187text19 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text19", _loc_2, param1));
            }
            return;
        }// end function

        public function set text16(param1:TextInput) : void
        {
            var _loc_2:* = this._877022190text16;
            if (_loc_2 !== param1)
            {
                this._877022190text16 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text16", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button56_click(event:MouseEvent) : void
        {
            this.loadText(this.special08);
            return;
        }// end function

        public function get text19() : TextInput
        {
            return this._877022187text19;
        }// end function

        public function set text18(param1:TextInput) : void
        {
            var _loc_2:* = this._877022188text18;
            if (_loc_2 !== param1)
            {
                this._877022188text18 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text18", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button39_click(event:MouseEvent) : void
        {
            this.loadText(this.ad06);
            return;
        }// end function

        public function get text14() : TextInput
        {
            return this._877022192text14;
        }// end function

        public function get text17() : TextInput
        {
            return this._877022189text17;
        }// end function

        public function get text20() : TextInput
        {
            return this._877022165text20;
        }// end function

        public function set text15(param1:TextInput) : void
        {
            var _loc_2:* = this._877022191text15;
            if (_loc_2 !== param1)
            {
                this._877022191text15 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text15", _loc_2, param1));
            }
            return;
        }// end function

        private function get speed() : int
        {
            return this._109641799speed;
        }// end function

        private function loadInForeground() : void
        {
            if (this.availableList.selectedItem == null)
            {
                return;
            }
            if (this.currentFg != null)
            {
                this.currentFg.stop();
            }
            if (this.scroller != null)
            {
                this.scroller.stop();
            }
            this.currentFg = AbstractVideoObject(this.availableList.selectedItem);
            this.currentFg.horizontalScrollPolicy = "off";
            this.currentFg.verticalScrollPolicy = "off";
            this.foregroundCanvas.removeAllChildren();
            this.foregroundCanvas.setStyle("backgroundColor", 0);
            this.foregroundCanvas.addChild(this.currentFg);
            this.currentFg.play();
            return;
        }// end function

        private function set scrolltextcolor(param1:uint) : void
        {
            var _loc_2:* = this._460681687scrolltextcolor;
            if (_loc_2 !== param1)
            {
                this._460681687scrolltextcolor = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrolltextcolor", _loc_2, param1));
            }
            return;
        }// end function

        public function set text20(param1:TextInput) : void
        {
            var _loc_2:* = this._877022165text20;
            if (_loc_2 !== param1)
            {
                this._877022165text20 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text20", _loc_2, param1));
            }
            return;
        }// end function

        public function get text15() : TextInput
        {
            return this._877022191text15;
        }// end function

        public function set canvasHold(param1:Canvas) : void
        {
            var _loc_2:* = this._1462923831canvasHold;
            if (_loc_2 !== param1)
            {
                this._1462923831canvasHold = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvasHold", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button11_click(event:MouseEvent) : void
        {
            this.loadText(this.text02);
            return;
        }// end function

        public function ___baseball_Button3_click(event:MouseEvent) : void
        {
            (this.fx - 1);
            return;
        }// end function

        public function get foregroundCanvas() : Canvas
        {
            return this._1589021819foregroundCanvas;
        }// end function

        public function get special03() : TextInput
        {
            return this._1694761860special03;
        }// end function

        public function __mouseHider_mouseOut(event:MouseEvent) : void
        {
            Mouse.show();
            this.mouseHider.setStyle("borderThickness", 0);
            return;
        }// end function

        public function get special05() : TextInput
        {
            return this._1694761858special05;
        }// end function

        public function get special06() : TextInput
        {
            return this._1694761857special06;
        }// end function

        public function get special07() : TextInput
        {
            return this._1694761856special07;
        }// end function

        public function get special01() : TextInput
        {
            return this._1694761862special01;
        }// end function

        public function get special04() : TextInput
        {
            return this._1694761859special04;
        }// end function

        public function get special08() : TextInput
        {
            return this._1694761855special08;
        }// end function

        public function get special09() : TextInput
        {
            return this._1694761854special09;
        }// end function

        public function get special02() : TextInput
        {
            return this._1694761861special02;
        }// end function

        public function ___baseball_Button22_click(event:MouseEvent) : void
        {
            this.loadText(this.text13);
            return;
        }// end function

        private function get objectList() : ArrayCollection
        {
            return this._1066602621objectList;
        }// end function

        private function set speed(param1:int) : void
        {
            var _loc_2:* = this._109641799speed;
            if (_loc_2 !== param1)
            {
                this._109641799speed = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "speed", _loc_2, param1));
            }
            return;
        }// end function

        private function get scrollbackgroundcolor() : uint
        {
            return this._1927615352scrollbackgroundcolor;
        }// end function

        private function get direction2() : String
        {
            return this._224454803direction2;
        }// end function

        public function get special10() : TextInput
        {
            return this._1694761832special10;
        }// end function

        private function get direction3() : String
        {
            return this._224454804direction3;
        }// end function

        private function get textcolor3() : uint
        {
            return this._1989825379textcolor3;
        }// end function

        public function set textcolorpicker3(param1:ColorPicker) : void
        {
            var _loc_2:* = this._1638580657textcolorpicker3;
            if (_loc_2 !== param1)
            {
                this._1638580657textcolorpicker3 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textcolorpicker3", _loc_2, param1));
            }
            return;
        }// end function

        public function set textcolorpicker2(param1:ColorPicker) : void
        {
            var _loc_2:* = this._1638580658textcolorpicker2;
            if (_loc_2 !== param1)
            {
                this._1638580658textcolorpicker2 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textcolorpicker2", _loc_2, param1));
            }
            return;
        }// end function

        public function __backgroundcolorpicker2_doubleClick(event:MouseEvent) : void
        {
            this.backgroundcolor2 = 0;
            return;
        }// end function

        public function get slide2() : HSlider
        {
            return this._899647327slide2;
        }// end function

        public function get slide3() : HSlider
        {
            return this._899647326slide3;
        }// end function

        public function ___baseball_Button33_click(event:MouseEvent) : void
        {
            this.direction = "v";
            return;
        }// end function

        private function set textcolor(param1:uint) : void
        {
            var _loc_2:* = this._1034019242textcolor;
            if (_loc_2 !== param1)
            {
                this._1034019242textcolor = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textcolor", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button50_click(event:MouseEvent) : void
        {
            this.loadText(this.special02);
            return;
        }// end function

        public function ___baseball_Button16_click(event:MouseEvent) : void
        {
            this.loadText(this.text07);
            return;
        }// end function

        private function get textcolor2() : uint
        {
            return this._1989825380textcolor2;
        }// end function

        public function ___baseball_Button61_click(event:MouseEvent) : void
        {
            this.direction3 = "^";
            return;
        }// end function

        public function set textcolorpicker(param1:ColorPicker) : void
        {
            var _loc_2:* = this._1992520092textcolorpicker;
            if (_loc_2 !== param1)
            {
                this._1992520092textcolorpicker = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textcolorpicker", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button44_click(event:MouseEvent) : void
        {
            this.direction2 = "<";
            return;
        }// end function

        private function get speed3() : int
        {
            return this._896071476speed3;
        }// end function

        public function get backgroundcolorpicker2() : ColorPicker
        {
            return this._358460209backgroundcolorpicker2;
        }// end function

        public function ___baseball_Button27_click(event:MouseEvent) : void
        {
            this.loadText(this.text18);
            return;
        }// end function

        private function get fx() : int
        {
            return this._3282fx;
        }// end function

        private function get fy() : int
        {
            return this._3283fy;
        }// end function

        public function get backgroundcolorpicker3() : ColorPicker
        {
            return this._358460208backgroundcolorpicker3;
        }// end function

        private function get speed2() : int
        {
            return this._896071477speed2;
        }// end function

        public function ___baseball_Button55_click(event:MouseEvent) : void
        {
            this.loadText(this.special07);
            return;
        }// end function

        public function ___baseball_Button38_click(event:MouseEvent) : void
        {
            this.loadText(this.ad05);
            return;
        }// end function

        public function set special01(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761862special01;
            if (_loc_2 !== param1)
            {
                this._1694761862special01 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special01", _loc_2, param1));
            }
            return;
        }// end function

        public function set foregroundCanvas(param1:Canvas) : void
        {
            var _loc_2:* = this._1589021819foregroundCanvas;
            if (_loc_2 !== param1)
            {
                this._1589021819foregroundCanvas = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "foregroundCanvas", _loc_2, param1));
            }
            return;
        }// end function

        public function set special03(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761860special03;
            if (_loc_2 !== param1)
            {
                this._1694761860special03 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special03", _loc_2, param1));
            }
            return;
        }// end function

        public function set special04(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761859special04;
            if (_loc_2 !== param1)
            {
                this._1694761859special04 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special04", _loc_2, param1));
            }
            return;
        }// end function

        public function set special05(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761858special05;
            if (_loc_2 !== param1)
            {
                this._1694761858special05 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special05", _loc_2, param1));
            }
            return;
        }// end function

        public function set special02(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761861special02;
            if (_loc_2 !== param1)
            {
                this._1694761861special02 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special02", _loc_2, param1));
            }
            return;
        }// end function

        public function set special07(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761856special07;
            if (_loc_2 !== param1)
            {
                this._1694761856special07 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special07", _loc_2, param1));
            }
            return;
        }// end function

        private function set objectList(param1:ArrayCollection) : void
        {
            var _loc_2:* = this._1066602621objectList;
            if (_loc_2 !== param1)
            {
                this._1066602621objectList = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "objectList", _loc_2, param1));
            }
            return;
        }// end function

        public function set special08(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761855special08;
            if (_loc_2 !== param1)
            {
                this._1694761855special08 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special08", _loc_2, param1));
            }
            return;
        }// end function

        public function set special06(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761857special06;
            if (_loc_2 !== param1)
            {
                this._1694761857special06 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special06", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button49_click(event:MouseEvent) : void
        {
            this.loadText(this.special01);
            return;
        }// end function

        public function ___baseball_Button66_click(event:MouseEvent) : void
        {
            NativeApplication.nativeApplication.exit();
            return;
        }// end function

        private function set scrollbackgroundcolor(param1:uint) : void
        {
            var _loc_2:* = this._1927615352scrollbackgroundcolor;
            if (_loc_2 !== param1)
            {
                this._1927615352scrollbackgroundcolor = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrollbackgroundcolor", _loc_2, param1));
            }
            return;
        }// end function

        public function set special09(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761854special09;
            if (_loc_2 !== param1)
            {
                this._1694761854special09 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special09", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button10_click(event:MouseEvent) : void
        {
            this.loadText(this.text01);
            return;
        }// end function

        private function set direction2(param1:String) : void
        {
            var _loc_2:* = this._224454803direction2;
            if (_loc_2 !== param1)
            {
                this._224454803direction2 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "direction2", _loc_2, param1));
            }
            return;
        }// end function

        public function __slide2_change(event:SliderEvent) : void
        {
            this.speed2 = this.slide2.value;
            return;
        }// end function

        private function set direction3(param1:String) : void
        {
            var _loc_2:* = this._224454804direction3;
            if (_loc_2 !== param1)
            {
                this._224454804direction3 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "direction3", _loc_2, param1));
            }
            return;
        }// end function

        public function set special10(param1:TextInput) : void
        {
            var _loc_2:* = this._1694761832special10;
            if (_loc_2 !== param1)
            {
                this._1694761832special10 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "special10", _loc_2, param1));
            }
            return;
        }// end function

        private function set textcolor2(param1:uint) : void
        {
            var _loc_2:* = this._1989825380textcolor2;
            if (_loc_2 !== param1)
            {
                this._1989825380textcolor2 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textcolor2", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button2_click(event:MouseEvent) : void
        {
            (this.fy + 1);
            return;
        }// end function

        private function set textcolor3(param1:uint) : void
        {
            var _loc_2:* = this._1989825379textcolor3;
            if (_loc_2 !== param1)
            {
                this._1989825379textcolor3 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textcolor3", _loc_2, param1));
            }
            return;
        }// end function

        public function set slide2(param1:HSlider) : void
        {
            var _loc_2:* = this._899647327slide2;
            if (_loc_2 !== param1)
            {
                this._899647327slide2 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slide2", _loc_2, param1));
            }
            return;
        }// end function

        public function __backgroundcolorpicker2_change(event:ColorPickerEvent) : void
        {
            this.backgroundcolor2 = this.backgroundcolorpicker2.selectedColor;
            return;
        }// end function

        public function set slide3(param1:HSlider) : void
        {
            var _loc_2:* = this._899647326slide3;
            if (_loc_2 !== param1)
            {
                this._899647326slide3 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slide3", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button21_click(event:MouseEvent) : void
        {
            this.loadText(this.text12);
            return;
        }// end function

        public function get ad01() : TextInput
        {
            return this._2987364ad01;
        }// end function

        public function get ad02() : TextInput
        {
            return this._2987365ad02;
        }// end function

        public function get ad03() : TextInput
        {
            return this._2987366ad03;
        }// end function

        public function get ad04() : TextInput
        {
            return this._2987367ad04;
        }// end function

        public function get ad06() : TextInput
        {
            return this._2987369ad06;
        }// end function

        public function get ad08() : TextInput
        {
            return this._2987371ad08;
        }// end function

        public function get ad09() : TextInput
        {
            return this._2987372ad09;
        }// end function

        public function ___baseball_Button15_click(event:MouseEvent) : void
        {
            this.loadText(this.text06);
            return;
        }// end function

        public function ___baseball_Button32_click(event:MouseEvent) : void
        {
            this.direction = "^";
            return;
        }// end function

        public function get ad05() : TextInput
        {
            return this._2987368ad05;
        }// end function

        public function __mouseHider_mouseOver(event:MouseEvent) : void
        {
            Mouse.hide();
            this.mouseHider.setStyle("borderThickness", 1);
            return;
        }// end function

        public function ___baseball_Button60_click(event:MouseEvent) : void
        {
            this.direction3 = "-";
            return;
        }// end function

        public function get ad07() : TextInput
        {
            return this._2987370ad07;
        }// end function

        private function set speed3(param1:int) : void
        {
            var _loc_2:* = this._896071476speed3;
            if (_loc_2 !== param1)
            {
                this._896071476speed3 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "speed3", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button43_click(event:MouseEvent) : void
        {
            this.loadText(this.ad10);
            return;
        }// end function

        private function set speed2(param1:int) : void
        {
            var _loc_2:* = this._896071477speed2;
            if (_loc_2 !== param1)
            {
                this._896071477speed2 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "speed2", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button26_click(event:MouseEvent) : void
        {
            this.loadText(this.text17);
            return;
        }// end function

        public function set backgroundcolorpicker3(param1:ColorPicker) : void
        {
            var _loc_2:* = this._358460208backgroundcolorpicker3;
            if (_loc_2 !== param1)
            {
                this._358460208backgroundcolorpicker3 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundcolorpicker3", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button54_click(event:MouseEvent) : void
        {
            this.loadText(this.special06);
            return;
        }// end function

        private function set fx(param1:int) : void
        {
            var _loc_2:* = this._3282fx;
            if (_loc_2 !== param1)
            {
                this._3282fx = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fx", _loc_2, param1));
            }
            return;
        }// end function

        public function set backgroundcolorpicker2(param1:ColorPicker) : void
        {
            var _loc_2:* = this._358460209backgroundcolorpicker2;
            if (_loc_2 !== param1)
            {
                this._358460209backgroundcolorpicker2 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundcolorpicker2", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button37_click(event:MouseEvent) : void
        {
            this.loadText(this.ad04);
            return;
        }// end function

        private function get scrollspeed() : int
        {
            return this._2083803546scrollspeed;
        }// end function

        private function set fy(param1:int) : void
        {
            var _loc_2:* = this._3283fy;
            if (_loc_2 !== param1)
            {
                this._3283fy = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fy", _loc_2, param1));
            }
            return;
        }// end function

        public function get slide() : HSlider
        {
            return this._109526449slide;
        }// end function

        public function get ad10() : TextInput
        {
            return this._2987394ad10;
        }// end function

        function _baseball_StylesInit() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            if (mx_internal::_baseball_StylesInit_done)
            {
                return;
            }
            mx_internal::_baseball_StylesInit_done = true;
            var _loc_3:* = StyleManager;
            _loc_3.mx_internal::initProtoChainRoots();
            return;
        }// end function

        public function get mouseHider() : Canvas
        {
            return this._986234315mouseHider;
        }// end function

        public function ___baseball_Button48_click(event:MouseEvent) : void
        {
            this.direction2 = "*";
            return;
        }// end function

        public function __textcolorpicker_change(event:ColorPickerEvent) : void
        {
            this.textcolor = this.textcolorpicker.selectedColor;
            return;
        }// end function

        private function createBuiltins() : void
        {
            this.objectList.addItem(new SWCVideoObject("Out", out));
            this.objectList.addItem(new SWCVideoObject("Flyout", flyout));
            this.objectList.addItem(new SWCVideoObject("Strikeout", strikeoutblack));
            this.objectList.addItem(new SWCVideoObject("Strikeout 2", strikeout2black));
            this.objectList.addItem(new SWCVideoObject("Walk", walkblack));
            this.objectList.addItem(new SWCVideoObject("Basehit", basehit));
            this.objectList.addItem(new SWCVideoObject("Double", double));
            this.objectList.addItem(new SWCVideoObject("Triple", triple));
            this.objectList.addItem(new SWCVideoObject("Score", score));
            this.objectList.addItem(new SWCVideoObject("Bases Loaded", basesloaded));
            this.objectList.addItem(new SWCVideoObject("Double Play", doubleplay));
            this.objectList.addItem(new SWCVideoObject("Stolen Base", stolenbase));
            this.objectList.addItem(new SWCVideoObject("Homerun", homerun));
            this.objectList.addItem(new SWCVideoObject("Homerun Awesome", awesome));
            this.objectList.addItem(new SWCVideoObject("Homerun 1 Solo", hr1rbi));
            this.objectList.addItem(new SWCVideoObject("Homerun 2 Two-Run", hr2rbi));
            this.objectList.addItem(new SWCVideoObject("Homerun 3 Three-Run", hr3rbi));
            this.objectList.addItem(new SWCVideoObject("Homerun 4 Grandslam", hr4rbi));
            this.objectList.addItem(new SWCVideoObject("Hit by pitch", hp));
            this.objectList.addItem(new SWCVideoObject("Buchbinder", sparmobil));
            this.objectList.addItem(new SWCVideoObject("Bayernhafen", bayernhafen));
            this.objectList.addItem(new SWCVideoObject("Arcaden", arcaden));
            this.objectList.addItem(new SWCVideoObject("Arcaden stumm", arcadenstumm));
            this.objectList.addItem(new SWCVideoObject("Arcaden grau", arcaden_grey));
            this.objectList.addItem(new SWCVideoObject("Arcaden grau stumm", arcadengreystumm));
            this.objectList.addItem(new SWCVideoObject("Maschek", maschek));
            this.objectList.addItem(new SWCVideoObject("Subway", subway));
            this.objectList.addItem(new SWCVideoObject("Sparkasse", sparkasse));
            return;
        }// end function

        public function __backgroundcolorpicker_doubleClick(event:MouseEvent) : void
        {
            this.backgroundcolor = 0;
            return;
        }// end function

        public function __slide_change(event:SliderEvent) : void
        {
            this.speed = this.slide.value;
            return;
        }// end function

        private function set backgroundcolor(param1:uint) : void
        {
            var _loc_2:* = this._1316677365backgroundcolor;
            if (_loc_2 !== param1)
            {
                this._1316677365backgroundcolor = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundcolor", _loc_2, param1));
            }
            return;
        }// end function

        public function __tab2_click(event:MouseEvent) : void
        {
            this.showTab(2);
            return;
        }// end function

        public function ___baseball_Button59_click(event:MouseEvent) : void
        {
            this.direction3 = "<";
            return;
        }// end function

        public function ___baseball_Button1_click(event:MouseEvent) : void
        {
            (this.fy - 1);
            return;
        }// end function

        private function _baseball_bindingsSetup() : Array
        {
            var binding:Binding;
            var result:Array;
            binding = new Binding(this, function () : Object
            {
                return objectList;
            }// end function
            , function (param1:Object) : void
            {
                availableList.dataProvider = param1;
                return;
            }// end function
            , "availableList.dataProvider");
            result[0] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button10.label = param1;
                return;
            }// end function
            , "_baseball_Button10.label");
            result[1] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text01.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button10.enabled = param1;
                return;
            }// end function
            , "_baseball_Button10.enabled");
            result[2] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button11.label = param1;
                return;
            }// end function
            , "_baseball_Button11.label");
            result[3] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text02.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button11.enabled = param1;
                return;
            }// end function
            , "_baseball_Button11.enabled");
            result[4] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button12.label = param1;
                return;
            }// end function
            , "_baseball_Button12.label");
            result[5] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text03.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button12.enabled = param1;
                return;
            }// end function
            , "_baseball_Button12.enabled");
            result[6] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button13.label = param1;
                return;
            }// end function
            , "_baseball_Button13.label");
            result[7] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text04.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button13.enabled = param1;
                return;
            }// end function
            , "_baseball_Button13.enabled");
            result[8] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button14.label = param1;
                return;
            }// end function
            , "_baseball_Button14.label");
            result[9] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text05.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button14.enabled = param1;
                return;
            }// end function
            , "_baseball_Button14.enabled");
            result[10] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button15.label = param1;
                return;
            }// end function
            , "_baseball_Button15.label");
            result[11] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text06.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button15.enabled = param1;
                return;
            }// end function
            , "_baseball_Button15.enabled");
            result[12] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button16.label = param1;
                return;
            }// end function
            , "_baseball_Button16.label");
            result[13] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text07.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button16.enabled = param1;
                return;
            }// end function
            , "_baseball_Button16.enabled");
            result[14] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button17.label = param1;
                return;
            }// end function
            , "_baseball_Button17.label");
            result[15] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text08.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button17.enabled = param1;
                return;
            }// end function
            , "_baseball_Button17.enabled");
            result[16] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button18.label = param1;
                return;
            }// end function
            , "_baseball_Button18.label");
            result[17] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text09.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button18.enabled = param1;
                return;
            }// end function
            , "_baseball_Button18.enabled");
            result[18] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button19.label = param1;
                return;
            }// end function
            , "_baseball_Button19.label");
            result[19] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text10.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button19.enabled = param1;
                return;
            }// end function
            , "_baseball_Button19.enabled");
            result[20] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button20.label = param1;
                return;
            }// end function
            , "_baseball_Button20.label");
            result[21] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text11.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button20.enabled = param1;
                return;
            }// end function
            , "_baseball_Button20.enabled");
            result[22] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button21.label = param1;
                return;
            }// end function
            , "_baseball_Button21.label");
            result[23] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text12.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button21.enabled = param1;
                return;
            }// end function
            , "_baseball_Button21.enabled");
            result[24] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button22.label = param1;
                return;
            }// end function
            , "_baseball_Button22.label");
            result[25] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text13.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button22.enabled = param1;
                return;
            }// end function
            , "_baseball_Button22.enabled");
            result[26] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button23.label = param1;
                return;
            }// end function
            , "_baseball_Button23.label");
            result[27] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text14.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button23.enabled = param1;
                return;
            }// end function
            , "_baseball_Button23.enabled");
            result[28] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button24.label = param1;
                return;
            }// end function
            , "_baseball_Button24.label");
            result[29] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text15.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button24.enabled = param1;
                return;
            }// end function
            , "_baseball_Button24.enabled");
            result[30] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button25.label = param1;
                return;
            }// end function
            , "_baseball_Button25.label");
            result[31] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text16.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button25.enabled = param1;
                return;
            }// end function
            , "_baseball_Button25.enabled");
            result[32] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button26.label = param1;
                return;
            }// end function
            , "_baseball_Button26.label");
            result[33] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text17.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button26.enabled = param1;
                return;
            }// end function
            , "_baseball_Button26.enabled");
            result[34] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button27.label = param1;
                return;
            }// end function
            , "_baseball_Button27.label");
            result[35] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text18.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button27.enabled = param1;
                return;
            }// end function
            , "_baseball_Button27.enabled");
            result[36] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button28.label = param1;
                return;
            }// end function
            , "_baseball_Button28.label");
            result[37] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text19.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button28.enabled = param1;
                return;
            }// end function
            , "_baseball_Button28.enabled");
            result[38] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button29.label = param1;
                return;
            }// end function
            , "_baseball_Button29.label");
            result[39] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return text20.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button29.enabled = param1;
                return;
            }// end function
            , "_baseball_Button29.enabled");
            result[40] = binding;
            binding = new Binding(this, function () : uint
            {
                return textcolor;
            }// end function
            , function (param1:uint) : void
            {
                textcolorpicker.selectedColor = param1;
                return;
            }// end function
            , "textcolorpicker.selectedColor");
            result[41] = binding;
            binding = new Binding(this, function () : uint
            {
                return backgroundcolor;
            }// end function
            , function (param1:uint) : void
            {
                backgroundcolorpicker.selectedColor = param1;
                return;
            }// end function
            , "backgroundcolorpicker.selectedColor");
            result[42] = binding;
            binding = new Binding(this, function () : Number
            {
                return speed;
            }// end function
            , function (param1:Number) : void
            {
                slide.value = param1;
                return;
            }// end function
            , "slide.value");
            result[43] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button34.label = param1;
                return;
            }// end function
            , "_baseball_Button34.label");
            result[44] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad01.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button34.enabled = param1;
                return;
            }// end function
            , "_baseball_Button34.enabled");
            result[45] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button35.label = param1;
                return;
            }// end function
            , "_baseball_Button35.label");
            result[46] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad02.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button35.enabled = param1;
                return;
            }// end function
            , "_baseball_Button35.enabled");
            result[47] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button36.label = param1;
                return;
            }// end function
            , "_baseball_Button36.label");
            result[48] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad03.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button36.enabled = param1;
                return;
            }// end function
            , "_baseball_Button36.enabled");
            result[49] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button37.label = param1;
                return;
            }// end function
            , "_baseball_Button37.label");
            result[50] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad04.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button37.enabled = param1;
                return;
            }// end function
            , "_baseball_Button37.enabled");
            result[51] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button38.label = param1;
                return;
            }// end function
            , "_baseball_Button38.label");
            result[52] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad05.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button38.enabled = param1;
                return;
            }// end function
            , "_baseball_Button38.enabled");
            result[53] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button39.label = param1;
                return;
            }// end function
            , "_baseball_Button39.label");
            result[54] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad06.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button39.enabled = param1;
                return;
            }// end function
            , "_baseball_Button39.enabled");
            result[55] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button40.label = param1;
                return;
            }// end function
            , "_baseball_Button40.label");
            result[56] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad07.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button40.enabled = param1;
                return;
            }// end function
            , "_baseball_Button40.enabled");
            result[57] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button41.label = param1;
                return;
            }// end function
            , "_baseball_Button41.label");
            result[58] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad08.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button41.enabled = param1;
                return;
            }// end function
            , "_baseball_Button41.enabled");
            result[59] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button42.label = param1;
                return;
            }// end function
            , "_baseball_Button42.label");
            result[60] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad09.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button42.enabled = param1;
                return;
            }// end function
            , "_baseball_Button42.enabled");
            result[61] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction2;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button43.label = param1;
                return;
            }// end function
            , "_baseball_Button43.label");
            result[62] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return ad10.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button43.enabled = param1;
                return;
            }// end function
            , "_baseball_Button43.enabled");
            result[63] = binding;
            binding = new Binding(this, function () : uint
            {
                return textcolor2;
            }// end function
            , function (param1:uint) : void
            {
                textcolorpicker2.selectedColor = param1;
                return;
            }// end function
            , "textcolorpicker2.selectedColor");
            result[64] = binding;
            binding = new Binding(this, function () : uint
            {
                return backgroundcolor2;
            }// end function
            , function (param1:uint) : void
            {
                backgroundcolorpicker2.selectedColor = param1;
                return;
            }// end function
            , "backgroundcolorpicker2.selectedColor");
            result[65] = binding;
            binding = new Binding(this, function () : Number
            {
                return speed2;
            }// end function
            , function (param1:Number) : void
            {
                slide2.value = param1;
                return;
            }// end function
            , "slide2.value");
            result[66] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button49.label = param1;
                return;
            }// end function
            , "_baseball_Button49.label");
            result[67] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special01.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button49.enabled = param1;
                return;
            }// end function
            , "_baseball_Button49.enabled");
            result[68] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button50.label = param1;
                return;
            }// end function
            , "_baseball_Button50.label");
            result[69] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special02.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button50.enabled = param1;
                return;
            }// end function
            , "_baseball_Button50.enabled");
            result[70] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button51.label = param1;
                return;
            }// end function
            , "_baseball_Button51.label");
            result[71] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special03.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button51.enabled = param1;
                return;
            }// end function
            , "_baseball_Button51.enabled");
            result[72] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button52.label = param1;
                return;
            }// end function
            , "_baseball_Button52.label");
            result[73] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special04.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button52.enabled = param1;
                return;
            }// end function
            , "_baseball_Button52.enabled");
            result[74] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button53.label = param1;
                return;
            }// end function
            , "_baseball_Button53.label");
            result[75] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special05.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button53.enabled = param1;
                return;
            }// end function
            , "_baseball_Button53.enabled");
            result[76] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button54.label = param1;
                return;
            }// end function
            , "_baseball_Button54.label");
            result[77] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special06.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button54.enabled = param1;
                return;
            }// end function
            , "_baseball_Button54.enabled");
            result[78] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button55.label = param1;
                return;
            }// end function
            , "_baseball_Button55.label");
            result[79] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special07.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button55.enabled = param1;
                return;
            }// end function
            , "_baseball_Button55.enabled");
            result[80] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button56.label = param1;
                return;
            }// end function
            , "_baseball_Button56.label");
            result[81] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special08.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button56.enabled = param1;
                return;
            }// end function
            , "_baseball_Button56.enabled");
            result[82] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button57.label = param1;
                return;
            }// end function
            , "_baseball_Button57.label");
            result[83] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special09.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button57.enabled = param1;
                return;
            }// end function
            , "_baseball_Button57.enabled");
            result[84] = binding;
            binding = new Binding(this, function () : String
            {
                var _loc_1:* = direction3;
                var _loc_2:* = _loc_1 == undefined ? (null) : (String(_loc_1));
                return _loc_2;
            }// end function
            , function (param1:String) : void
            {
                _baseball_Button58.label = param1;
                return;
            }// end function
            , "_baseball_Button58.label");
            result[85] = binding;
            binding = new Binding(this, function () : Boolean
            {
                return special10.text.length > 0;
            }// end function
            , function (param1:Boolean) : void
            {
                _baseball_Button58.enabled = param1;
                return;
            }// end function
            , "_baseball_Button58.enabled");
            result[86] = binding;
            binding = new Binding(this, function () : uint
            {
                return textcolor3;
            }// end function
            , function (param1:uint) : void
            {
                textcolorpicker3.selectedColor = param1;
                return;
            }// end function
            , "textcolorpicker3.selectedColor");
            result[87] = binding;
            binding = new Binding(this, function () : uint
            {
                return backgroundcolor3;
            }// end function
            , function (param1:uint) : void
            {
                backgroundcolorpicker3.selectedColor = param1;
                return;
            }// end function
            , "backgroundcolorpicker3.selectedColor");
            result[88] = binding;
            binding = new Binding(this, function () : Number
            {
                return speed3;
            }// end function
            , function (param1:Number) : void
            {
                slide3.value = param1;
                return;
            }// end function
            , "slide3.value");
            result[89] = binding;
            binding = new Binding(this, function () : Number
            {
                return fx - 32;
            }// end function
            , function (param1:Number) : void
            {
                mouseHider.x = param1;
                return;
            }// end function
            , "mouseHider.x");
            result[90] = binding;
            binding = new Binding(this, function () : Number
            {
                return fy - 32;
            }// end function
            , function (param1:Number) : void
            {
                mouseHider.y = param1;
                return;
            }// end function
            , "mouseHider.y");
            result[91] = binding;
            binding = new Binding(this, function () : Number
            {
                return fx;
            }// end function
            , function (param1:Number) : void
            {
                foregroundCanvas.x = param1;
                return;
            }// end function
            , "foregroundCanvas.x");
            result[92] = binding;
            binding = new Binding(this, function () : Number
            {
                return fy;
            }// end function
            , function (param1:Number) : void
            {
                foregroundCanvas.y = param1;
                return;
            }// end function
            , "foregroundCanvas.y");
            result[93] = binding;
            return result;
        }// end function

        public function ___baseball_Button20_click(event:MouseEvent) : void
        {
            this.loadText(this.text11);
            return;
        }// end function

        public function get advertisement() : Canvas
        {
            return this._128069115advertisement;
        }// end function

        public function set availableList(param1:List) : void
        {
            var _loc_2:* = this._1872831239availableList;
            if (_loc_2 !== param1)
            {
                this._1872831239availableList = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "availableList", _loc_2, param1));
            }
            return;
        }// end function

        public function set saveButton(param1:Button) : void
        {
            var _loc_2:* = this._584254223saveButton;
            if (_loc_2 !== param1)
            {
                this._584254223saveButton = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "saveButton", _loc_2, param1));
            }
            return;
        }// end function

        public function __backgroundcolorpicker3_change(event:ColorPickerEvent) : void
        {
            this.backgroundcolor3 = this.backgroundcolorpicker3.selectedColor;
            return;
        }// end function

        public function __slide3_change(event:SliderEvent) : void
        {
            this.speed3 = this.slide3.value;
            return;
        }// end function

        public function __textcolorpicker3_doubleClick(event:MouseEvent) : void
        {
            this.textcolor3 = 16448250;
            return;
        }// end function

        public function ___baseball_Button31_click(event:MouseEvent) : void
        {
            this.direction = "-";
            return;
        }// end function

        public function ___baseball_Button14_click(event:MouseEvent) : void
        {
            this.loadText(this.text05);
            return;
        }// end function

        public function get canvasHold() : Canvas
        {
            return this._1462923831canvasHold;
        }// end function

        private function _baseball_bindingExprs() : void
        {
            var _loc_1:* = undefined;
            _loc_1 = this.objectList;
            _loc_1 = this.direction;
            _loc_1 = this.text01.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text02.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text03.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text04.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text05.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text06.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text07.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text08.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text09.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text10.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text11.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text12.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text13.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text14.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text15.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text16.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text17.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text18.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text19.text.length > 0;
            _loc_1 = this.direction;
            _loc_1 = this.text20.text.length > 0;
            _loc_1 = this.textcolor;
            _loc_1 = this.backgroundcolor;
            _loc_1 = this.speed;
            _loc_1 = this.direction2;
            _loc_1 = this.ad01.text.length > 0;
            _loc_1 = this.direction2;
            _loc_1 = this.ad02.text.length > 0;
            _loc_1 = this.direction2;
            _loc_1 = this.ad03.text.length > 0;
            _loc_1 = this.direction2;
            _loc_1 = this.ad04.text.length > 0;
            _loc_1 = this.direction2;
            _loc_1 = this.ad05.text.length > 0;
            _loc_1 = this.direction2;
            _loc_1 = this.ad06.text.length > 0;
            _loc_1 = this.direction2;
            _loc_1 = this.ad07.text.length > 0;
            _loc_1 = this.direction2;
            _loc_1 = this.ad08.text.length > 0;
            _loc_1 = this.direction2;
            _loc_1 = this.ad09.text.length > 0;
            _loc_1 = this.direction2;
            _loc_1 = this.ad10.text.length > 0;
            _loc_1 = this.textcolor2;
            _loc_1 = this.backgroundcolor2;
            _loc_1 = this.speed2;
            _loc_1 = this.direction3;
            _loc_1 = this.special01.text.length > 0;
            _loc_1 = this.direction3;
            _loc_1 = this.special02.text.length > 0;
            _loc_1 = this.direction3;
            _loc_1 = this.special03.text.length > 0;
            _loc_1 = this.direction3;
            _loc_1 = this.special04.text.length > 0;
            _loc_1 = this.direction3;
            _loc_1 = this.special05.text.length > 0;
            _loc_1 = this.direction3;
            _loc_1 = this.special06.text.length > 0;
            _loc_1 = this.direction3;
            _loc_1 = this.special07.text.length > 0;
            _loc_1 = this.direction3;
            _loc_1 = this.special08.text.length > 0;
            _loc_1 = this.direction3;
            _loc_1 = this.special09.text.length > 0;
            _loc_1 = this.direction3;
            _loc_1 = this.special10.text.length > 0;
            _loc_1 = this.textcolor3;
            _loc_1 = this.backgroundcolor3;
            _loc_1 = this.speed3;
            _loc_1 = this.fx - 32;
            _loc_1 = this.fy - 32;
            _loc_1 = this.fx;
            _loc_1 = this.fy;
            return;
        }// end function

        public function ___baseball_Button6_click(event:MouseEvent) : void
        {
            this.blankAll();
            return;
        }// end function

        private function get scrolltextcolor() : uint
        {
            return this._460681687scrolltextcolor;
        }// end function

        public function ___baseball_Button42_click(event:MouseEvent) : void
        {
            this.loadText(this.ad09);
            return;
        }// end function

        public function get textcolorpicker3() : ColorPicker
        {
            return this._1638580657textcolorpicker3;
        }// end function

        public function ___baseball_Button25_click(event:MouseEvent) : void
        {
            this.loadText(this.text16);
            return;
        }// end function

        private function get textcolor() : uint
        {
            return this._1034019242textcolor;
        }// end function

        public function get textcolorpicker2() : ColorPicker
        {
            return this._1638580658textcolorpicker2;
        }// end function

        public function get textcolorpicker() : ColorPicker
        {
            return this._1992520092textcolorpicker;
        }// end function

        public function ___baseball_Button53_click(event:MouseEvent) : void
        {
            this.loadText(this.special05);
            return;
        }// end function

        public function ___baseball_Button36_click(event:MouseEvent) : void
        {
            this.loadText(this.ad03);
            return;
        }// end function

        public function ___baseball_Button19_click(event:MouseEvent) : void
        {
            this.loadText(this.text10);
            return;
        }// end function

        public function set tab0(param1:Button) : void
        {
            var _loc_2:* = this._3552059tab0;
            if (_loc_2 !== param1)
            {
                this._3552059tab0 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab0", _loc_2, param1));
            }
            return;
        }// end function

        public function set tab1(param1:Button) : void
        {
            var _loc_2:* = this._3552060tab1;
            if (_loc_2 !== param1)
            {
                this._3552060tab1 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab1", _loc_2, param1));
            }
            return;
        }// end function

        public function set tab2(param1:Button) : void
        {
            var _loc_2:* = this._3552061tab2;
            if (_loc_2 !== param1)
            {
                this._3552061tab2 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab2", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button47_click(event:MouseEvent) : void
        {
            this.direction2 = "v";
            return;
        }// end function

        public function set textlist(param1:Canvas) : void
        {
            var _loc_2:* = this._1002924213textlist;
            if (_loc_2 !== param1)
            {
                this._1002924213textlist = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textlist", _loc_2, param1));
            }
            return;
        }// end function

        protected function fileSelectHandler(event:Event) : void
        {
            this.fileLoad.load();
            return;
        }// end function

        private function set scrolldirection(param1:String) : void
        {
            var _loc_2:* = this._389253294scrolldirection;
            if (_loc_2 !== param1)
            {
                this._389253294scrolldirection = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrolldirection", _loc_2, param1));
            }
            return;
        }// end function

        public function __tab1_click(event:MouseEvent) : void
        {
            this.showTab(1);
            return;
        }// end function

        private function applicationComplete() : void
        {
            this.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
            this.createBuiltins();
            return;
        }// end function

        public function ___baseball_Button58_click(event:MouseEvent) : void
        {
            this.loadText(this.special10);
            return;
        }// end function

        private function loadModuleList() : void
        {
            var _loc_2:* = null;
            var _loc_1:* = File.desktopDirectory.resolvePath("animations");
            for each (_loc_2 in _loc_1.getDirectoryListing())
            {
                
                this.objectList.addItem(new ModuleVideoObject(_loc_2.name, _loc_2.nativePath));
            }
            return;
        }// end function

        protected function fileCompleteHandler(event:Event) : void
        {
            var _loc_2:* = this.fileLoad.data.readMultiByte(this.fileLoad.data.length, "utf8");
            var _loc_3:* = _loc_2.split("\r");
            this.text01.text = _loc_3[0];
            this.text02.text = _loc_3[1];
            this.text03.text = _loc_3[2];
            this.text04.text = _loc_3[3];
            this.text05.text = _loc_3[4];
            this.text06.text = _loc_3[5];
            this.text07.text = _loc_3[6];
            this.text08.text = _loc_3[7];
            this.text09.text = _loc_3[8];
            this.text10.text = _loc_3[9];
            this.text11.text = _loc_3[10];
            this.text12.text = _loc_3[11];
            this.text13.text = _loc_3[12];
            this.text14.text = _loc_3[13];
            this.text15.text = _loc_3[14];
            this.text16.text = _loc_3[15];
            this.text17.text = _loc_3[16];
            this.text18.text = _loc_3[17];
            this.text19.text = _loc_3[18];
            this.text20.text = _loc_3[19];
            this.ad01.text = _loc_3[20];
            this.ad02.text = _loc_3[21];
            this.ad03.text = _loc_3[22];
            this.ad04.text = _loc_3[23];
            this.ad05.text = _loc_3[24];
            this.ad06.text = _loc_3[25];
            this.ad07.text = _loc_3[26];
            this.ad08.text = _loc_3[27];
            this.ad09.text = _loc_3[28];
            this.ad10.text = _loc_3[29];
            this.special01.text = _loc_3[30];
            this.special02.text = _loc_3[31];
            this.special03.text = _loc_3[32];
            this.special04.text = _loc_3[33];
            this.special05.text = _loc_3[34];
            this.special06.text = _loc_3[35];
            this.special07.text = _loc_3[36];
            this.special08.text = _loc_3[37];
            this.special09.text = _loc_3[38];
            this.special10.text = _loc_3[39];
            return;
        }// end function

        public function set others(param1:Canvas) : void
        {
            var _loc_2:* = this._1006804125others;
            if (_loc_2 !== param1)
            {
                this._1006804125others = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "others", _loc_2, param1));
            }
            return;
        }// end function

        public function set ad01(param1:TextInput) : void
        {
            var _loc_2:* = this._2987364ad01;
            if (_loc_2 !== param1)
            {
                this._2987364ad01 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad01", _loc_2, param1));
            }
            return;
        }// end function

        public function set ad02(param1:TextInput) : void
        {
            var _loc_2:* = this._2987365ad02;
            if (_loc_2 !== param1)
            {
                this._2987365ad02 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad02", _loc_2, param1));
            }
            return;
        }// end function

        public function set ad03(param1:TextInput) : void
        {
            var _loc_2:* = this._2987366ad03;
            if (_loc_2 !== param1)
            {
                this._2987366ad03 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad03", _loc_2, param1));
            }
            return;
        }// end function

        public function set ad04(param1:TextInput) : void
        {
            var _loc_2:* = this._2987367ad04;
            if (_loc_2 !== param1)
            {
                this._2987367ad04 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad04", _loc_2, param1));
            }
            return;
        }// end function

        public function set ad05(param1:TextInput) : void
        {
            var _loc_2:* = this._2987368ad05;
            if (_loc_2 !== param1)
            {
                this._2987368ad05 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad05", _loc_2, param1));
            }
            return;
        }// end function

        public function set ad06(param1:TextInput) : void
        {
            var _loc_2:* = this._2987369ad06;
            if (_loc_2 !== param1)
            {
                this._2987369ad06 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad06", _loc_2, param1));
            }
            return;
        }// end function

        public function set ad07(param1:TextInput) : void
        {
            var _loc_2:* = this._2987370ad07;
            if (_loc_2 !== param1)
            {
                this._2987370ad07 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad07", _loc_2, param1));
            }
            return;
        }// end function

        public function set ad08(param1:TextInput) : void
        {
            var _loc_2:* = this._2987371ad08;
            if (_loc_2 !== param1)
            {
                this._2987371ad08 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad08", _loc_2, param1));
            }
            return;
        }// end function

        public function set ad09(param1:TextInput) : void
        {
            var _loc_2:* = this._2987372ad09;
            if (_loc_2 !== param1)
            {
                this._2987372ad09 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad09", _loc_2, param1));
            }
            return;
        }// end function

        public function __textcolorpicker2_change(event:ColorPickerEvent) : void
        {
            this.textcolor2 = this.textcolorpicker2.selectedColor;
            return;
        }// end function

        public function ___baseball_Button30_click(event:MouseEvent) : void
        {
            this.direction = "<";
            return;
        }// end function

        public function ___baseball_Button13_click(event:MouseEvent) : void
        {
            this.loadText(this.text04);
            return;
        }// end function

        private function get backgroundcolor() : uint
        {
            return this._1316677365backgroundcolor;
        }// end function

        public function ___baseball_Button5_click(event:MouseEvent) : void
        {
            this.loadInForeground();
            return;
        }// end function

        private function set direction(param1:String) : void
        {
            var _loc_2:* = this._962590849direction;
            if (_loc_2 !== param1)
            {
                this._962590849direction = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "direction", _loc_2, param1));
            }
            return;
        }// end function

        public function get availableList() : List
        {
            return this._1872831239availableList;
        }// end function

        public function set buttons(param1:Canvas) : void
        {
            var _loc_2:* = this._241352577buttons;
            if (_loc_2 !== param1)
            {
                this._241352577buttons = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttons", _loc_2, param1));
            }
            return;
        }// end function

        public function __textcolorpicker_doubleClick(event:MouseEvent) : void
        {
            this.textcolor = 16448250;
            return;
        }// end function

        public function ___baseball_Button41_click(event:MouseEvent) : void
        {
            this.loadText(this.ad08);
            return;
        }// end function

        public function set ad10(param1:TextInput) : void
        {
            var _loc_2:* = this._2987394ad10;
            if (_loc_2 !== param1)
            {
                this._2987394ad10 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ad10", _loc_2, param1));
            }
            return;
        }// end function

        public function get saveButton() : Button
        {
            return this._584254223saveButton;
        }// end function

        protected function saveHandler(event:MouseEvent) : void
        {
            var _loc_2:* = new ByteArray();
            _loc_2.writeMultiByte(this.text01.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text02.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text03.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text04.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text05.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text06.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text07.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text08.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text09.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text10.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text11.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text12.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text13.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text14.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text15.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text16.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text17.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text18.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text19.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.text20.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad01.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad02.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad03.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad04.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad05.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad06.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad07.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad08.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad09.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.ad10.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special01.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special02.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special03.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special04.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special05.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special06.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special07.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special08.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special09.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            _loc_2.writeMultiByte(this.special10.text, "utf8");
            _loc_2.writeMultiByte("\r", "utf8");
            this.fileSave.save(_loc_2, "default.scoreboard");
            return;
        }// end function

        public function __availableList_doubleClick(event:MouseEvent) : void
        {
            this.loadInForeground();
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            this.saveButton.addEventListener(MouseEvent.CLICK, this.saveHandler);
            this.loadButton.addEventListener(MouseEvent.CLICK, this.loadHandler);
            return;
        }// end function

        public function ___baseball_Button24_click(event:MouseEvent) : void
        {
            this.loadText(this.text15);
            return;
        }// end function

        public function ___baseball_Button35_click(event:MouseEvent) : void
        {
            this.loadText(this.ad02);
            return;
        }// end function

        public function ___baseball_Button52_click(event:MouseEvent) : void
        {
            this.loadText(this.special04);
            return;
        }// end function

        public function ___baseball_Button18_click(event:MouseEvent) : void
        {
            this.loadText(this.text09);
            return;
        }// end function

        private function set scrollspeed(param1:int) : void
        {
            var _loc_2:* = this._2083803546scrollspeed;
            if (_loc_2 !== param1)
            {
                this._2083803546scrollspeed = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrollspeed", _loc_2, param1));
            }
            return;
        }// end function

        public function __backgroundcolorpicker3_doubleClick(event:MouseEvent) : void
        {
            this.backgroundcolor3 = 0;
            return;
        }// end function

        public function get tab0() : Button
        {
            return this._3552059tab0;
        }// end function

        public function get tab1() : Button
        {
            return this._3552060tab1;
        }// end function

        public function ___baseball_Button46_click(event:MouseEvent) : void
        {
            this.direction2 = "^";
            return;
        }// end function

        public function ___baseball_Button63_click(event:MouseEvent) : void
        {
            this.direction3 = "*";
            return;
        }// end function

        private function showTab(param1:int) : void
        {
            if (param1 == 0)
            {
                this.textlist.visible = true;
                this.advertisement.visible = false;
                this.others.visible = false;
                this.tab0.enabled = false;
                this.tab1.enabled = true;
                this.tab2.enabled = true;
            }
            else if (param1 == 1)
            {
                this.textlist.visible = false;
                this.advertisement.visible = true;
                this.others.visible = false;
                this.tab0.enabled = true;
                this.tab1.enabled = false;
                this.tab2.enabled = true;
            }
            else
            {
                this.textlist.visible = false;
                this.advertisement.visible = false;
                this.others.visible = true;
                this.tab0.enabled = true;
                this.tab1.enabled = true;
                this.tab2.enabled = false;
            }
            return;
        }// end function

        public function ___baseball_Button29_click(event:MouseEvent) : void
        {
            this.loadText(this.text20);
            return;
        }// end function

        public function get textlist() : Canvas
        {
            return this._1002924213textlist;
        }// end function

        public function get tab2() : Button
        {
            return this._3552061tab2;
        }// end function

        private function loadText(param1:TextInput) : void
        {
            if (this.currentFg != null)
            {
                this.currentFg.stop();
            }
            if (this.scroller != null)
            {
                this.scroller.stop();
                this.scroller = null;
            }
            this.scroller = new ScrollingText();
            this.scroller.width = 288;
            this.scroller.text = param1.text;
            if (this.tab0.enabled == false)
            {
                this.scrolldirection = this.direction;
                this.scrollspeed = this.speed;
                this.scrolltextcolor = this.textcolor;
                this.scrollbackgroundcolor = this.backgroundcolor;
            }
            else if (this.tab1.enabled == false)
            {
                this.scrolldirection = this.direction2;
                this.scrollspeed = this.speed2;
                this.scrolltextcolor = this.textcolor2;
                this.scrollbackgroundcolor = this.backgroundcolor2;
            }
            else
            {
                this.scrolldirection = this.direction3;
                this.scrollspeed = this.speed3;
                this.scrolltextcolor = this.textcolor3;
                this.scrollbackgroundcolor = this.backgroundcolor3;
            }
            this.scroller.setStyle("color", this.scrolltextcolor);
            this.scroller.setStyle("fontSize", 29);
            this.scroller.setStyle("fontFamily", "VAGRounded-Bold");
            switch(this.scrolldirection)
            {
                case "<":
                {
                    this.scroller.direction = "rightToLeft";
                    break;
                }
                case ">":
                {
                    this.scroller.direction = "leftToRight";
                    break;
                }
                case "^":
                {
                    this.scroller.direction = "bottomToTop";
                    break;
                }
                case "v":
                {
                    this.scroller.direction = "topToBottom";
                    break;
                }
                case "-":
                {
                    this.scroller.direction = "static";
                    break;
                }
                case "*":
                {
                    this.scroller.direction = "blink";
                    break;
                }
                default:
                {
                    break;
                }
            }
            this.scroller.speed = this.scrollspeed;
            this.scroller.start();
            this.foregroundCanvas.removeAllChildren();
            this.foregroundCanvas.setStyle("backgroundColor", this.scrollbackgroundcolor);
            this.foregroundCanvas.addChild(this.scroller);
            this.scroller.y = this.scroller.y - 4;
            this.scroller.start();
            return;
        }// end function

        private function get scrolldirection() : String
        {
            return this._389253294scrolldirection;
        }// end function

        public function get others() : Canvas
        {
            return this._1006804125others;
        }// end function

        public function __tab0_click(event:MouseEvent) : void
        {
            this.showTab(0);
            return;
        }// end function

        public function set slide(param1:HSlider) : void
        {
            var _loc_2:* = this._109526449slide;
            if (_loc_2 !== param1)
            {
                this._109526449slide = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slide", _loc_2, param1));
            }
            return;
        }// end function

        public function set loadButton(param1:Button) : void
        {
            var _loc_2:* = this._701492296loadButton;
            if (_loc_2 !== param1)
            {
                this._701492296loadButton = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loadButton", _loc_2, param1));
            }
            return;
        }// end function

        private function _baseball_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = ObjectRenderer;
            return _loc_1;
        }// end function

        public function ___baseball_Button57_click(event:MouseEvent) : void
        {
            this.loadText(this.special09);
            return;
        }// end function

        public function get buttons() : Canvas
        {
            return this._241352577buttons;
        }// end function

        protected function loadHandler(event:MouseEvent) : void
        {
            this.fileLoad.browse([this.filter]);
            this.fileLoad.addEventListener(Event.SELECT, this.fileSelectHandler);
            this.fileLoad.addEventListener(Event.COMPLETE, this.fileCompleteHandler);
            return;
        }// end function

        public function ___baseball_WindowedApplication1_applicationComplete(event:FlexEvent) : void
        {
            this.applicationComplete();
            return;
        }// end function

        public function __backgroundcolorpicker_change(event:ColorPickerEvent) : void
        {
            this.backgroundcolor = this.backgroundcolorpicker.selectedColor;
            return;
        }// end function

        public function set mouseHider(param1:Canvas) : void
        {
            var _loc_2:* = this._986234315mouseHider;
            if (_loc_2 !== param1)
            {
                this._986234315mouseHider = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mouseHider", _loc_2, param1));
            }
            return;
        }// end function

        override public function initialize() : void
        {
            var target:baseball;
            var watcherSetupUtilClass:Object;
            .mx_internal::setDocumentDescriptor(this._documentDescriptor_);
            var bindings:* = this._baseball_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_baseballWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                
                Binding(bindings[i]).execute();
                i = (i + 1);
            }
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
            return;
        }// end function

        private function get direction() : String
        {
            return this._962590849direction;
        }// end function

        public function __textcolorpicker2_doubleClick(event:MouseEvent) : void
        {
            this.textcolor2 = 16448250;
            return;
        }// end function

        public function set backgroundcolorpicker(param1:ColorPicker) : void
        {
            var _loc_2:* = this._1235362755backgroundcolorpicker;
            if (_loc_2 !== param1)
            {
                this._1235362755backgroundcolorpicker = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundcolorpicker", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button12_click(event:MouseEvent) : void
        {
            this.loadText(this.text03);
            return;
        }// end function

        private function blankAll() : void
        {
            if (this.currentFg)
            {
                this.currentFg.stop();
            }
            if (this.scroller)
            {
                this.scroller.stop();
                this.scroller = null;
            }
            this.foregroundCanvas.setStyle("backgroundColor", 0);
            this.foregroundCanvas.removeAllChildren();
            return;
        }// end function

        public function get loadButton() : Button
        {
            return this._701492296loadButton;
        }// end function

        private function set backgroundcolor2(param1:uint) : void
        {
            var _loc_2:* = this._2132674595backgroundcolor2;
            if (_loc_2 !== param1)
            {
                this._2132674595backgroundcolor2 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundcolor2", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button4_click(event:MouseEvent) : void
        {
            (this.fx + 1);
            return;
        }// end function

        public function ___baseball_Button40_click(event:MouseEvent) : void
        {
            this.loadText(this.ad07);
            return;
        }// end function

        private function set backgroundcolor3(param1:uint) : void
        {
            var _loc_2:* = this._2132674594backgroundcolor3;
            if (_loc_2 !== param1)
            {
                this._2132674594backgroundcolor3 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundcolor3", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button23_click(event:MouseEvent) : void
        {
            this.loadText(this.text14);
            return;
        }// end function

        public function __textcolorpicker3_change(event:ColorPickerEvent) : void
        {
            this.textcolor3 = this.textcolorpicker3.selectedColor;
            return;
        }// end function

        public function get backgroundcolorpicker() : ColorPicker
        {
            return this._1235362755backgroundcolorpicker;
        }// end function

        private function get backgroundcolor2() : uint
        {
            return this._2132674595backgroundcolor2;
        }// end function

        public function set text02(param1:TextInput) : void
        {
            var _loc_2:* = this._877022225text02;
            if (_loc_2 !== param1)
            {
                this._877022225text02 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text02", _loc_2, param1));
            }
            return;
        }// end function

        public function set text03(param1:TextInput) : void
        {
            var _loc_2:* = this._877022224text03;
            if (_loc_2 !== param1)
            {
                this._877022224text03 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text03", _loc_2, param1));
            }
            return;
        }// end function

        public function set text04(param1:TextInput) : void
        {
            var _loc_2:* = this._877022223text04;
            if (_loc_2 !== param1)
            {
                this._877022223text04 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text04", _loc_2, param1));
            }
            return;
        }// end function

        public function set text01(param1:TextInput) : void
        {
            var _loc_2:* = this._877022226text01;
            if (_loc_2 !== param1)
            {
                this._877022226text01 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text01", _loc_2, param1));
            }
            return;
        }// end function

        public function set text05(param1:TextInput) : void
        {
            var _loc_2:* = this._877022222text05;
            if (_loc_2 !== param1)
            {
                this._877022222text05 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text05", _loc_2, param1));
            }
            return;
        }// end function

        private function get backgroundcolor3() : uint
        {
            return this._2132674594backgroundcolor3;
        }// end function

        public function set text06(param1:TextInput) : void
        {
            var _loc_2:* = this._877022221text06;
            if (_loc_2 !== param1)
            {
                this._877022221text06 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text06", _loc_2, param1));
            }
            return;
        }// end function

        public function ___baseball_Button51_click(event:MouseEvent) : void
        {
            this.loadText(this.special03);
            return;
        }// end function

        public function set text08(param1:TextInput) : void
        {
            var _loc_2:* = this._877022219text08;
            if (_loc_2 !== param1)
            {
                this._877022219text08 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text08", _loc_2, param1));
            }
            return;
        }// end function

        public function get text02() : TextInput
        {
            return this._877022225text02;
        }// end function

        public function get text03() : TextInput
        {
            return this._877022224text03;
        }// end function

        public function ___baseball_Button17_click(event:MouseEvent) : void
        {
            this.loadText(this.text08);
            return;
        }// end function

        public function get text05() : TextInput
        {
            return this._877022222text05;
        }// end function

        public function ___baseball_Button34_click(event:MouseEvent) : void
        {
            this.loadText(this.ad01);
            return;
        }// end function

        public function get text07() : TextInput
        {
            return this._877022220text07;
        }// end function

        public function get text01() : TextInput
        {
            return this._877022226text01;
        }// end function

        public function set text07(param1:TextInput) : void
        {
            var _loc_2:* = this._877022220text07;
            if (_loc_2 !== param1)
            {
                this._877022220text07 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text07", _loc_2, param1));
            }
            return;
        }// end function

        public function get text04() : TextInput
        {
            return this._877022223text04;
        }// end function

        public function set text09(param1:TextInput) : void
        {
            var _loc_2:* = this._877022218text09;
            if (_loc_2 !== param1)
            {
                this._877022218text09 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text09", _loc_2, param1));
            }
            return;
        }// end function

        public function get text09() : TextInput
        {
            return this._877022218text09;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
        {
            baseball._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
