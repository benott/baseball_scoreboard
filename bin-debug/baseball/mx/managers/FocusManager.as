﻿package mx.managers
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;

    public class FocusManager extends Object implements IFocusManager
    {
        private var lastActiveFocusManager:FocusManager;
        private var _showFocusIndicator:Boolean = false;
        private var focusableCandidates:Array;
        private var LARGE_TAB_INDEX:int = 99999;
        private var browserFocusComponent:InteractiveObject;
        private var calculateCandidates:Boolean = true;
        private var _lastFocus:IFocusManagerComponent;
        private var lastAction:String;
        private var focusSetLocally:Boolean;
        private var focusableObjects:Array;
        private var swfBridgeGroup:SWFBridgeGroup;
        private var defButton:IButton;
        private var _form:IFocusManagerContainer;
        private var popup:Boolean;
        private var focusChanged:Boolean;
        private var _defaultButtonEnabled:Boolean = true;
        private var activated:Boolean = false;
        private var _defaultButton:IButton;
        private var fauxFocus:DisplayObject;
        private var _focusPane:Sprite;
        private var skipBridge:IEventDispatcher;
        public var browserMode:Boolean;
        static const VERSION:String = "3.6.0.21751";
        private static const FROM_INDEX_UNSPECIFIED:int = -2;

        public function FocusManager(param1:IFocusManagerContainer, param2:Boolean = false)
        {
            var sm:ISystemManager;
            var bridge:IEventDispatcher;
            var container:* = param1;
            var popup:* = param2;
            this.popup = popup;
            browserMode = Capabilities.playerType == "ActiveX" && !popup;
            container.focusManager = this;
            _form = container;
            focusableObjects = [];
            focusPane = new FlexSprite();
            focusPane.name = "focusPane";
            addFocusables(DisplayObject(container));
            container.addEventListener(Event.ADDED, addedHandler);
            container.addEventListener(Event.REMOVED, removedHandler);
            container.addEventListener(FlexEvent.SHOW, showHandler);
            container.addEventListener(FlexEvent.HIDE, hideHandler);
            if (container.systemManager is SystemManager)
            {
                if (container != SystemManager(container.systemManager).application)
                {
                    container.addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);
                }
            }
            try
            {
                container.systemManager.addFocusManager(container);
                sm = form.systemManager;
                swfBridgeGroup = new SWFBridgeGroup(sm);
                if (!popup)
                {
                    swfBridgeGroup.parentBridge = sm.swfBridgeGroup.parentBridge;
                }
                if (sm.useSWFBridge())
                {
                    sm.addEventListener(SWFBridgeEvent.BRIDGE_APPLICATION_UNLOADING, removeFromParentBridge);
                    bridge = swfBridgeGroup.parentBridge;
                    if (bridge)
                    {
                        bridge.addEventListener(SWFBridgeRequest.MOVE_FOCUS_REQUEST, focusRequestMoveHandler);
                        bridge.addEventListener(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST, setShowFocusIndicatorRequestHandler);
                    }
                    if (bridge && !(form.systemManager is SystemManagerProxy))
                    {
                        bridge.addEventListener(SWFBridgeRequest.ACTIVATE_FOCUS_REQUEST, focusRequestActivateHandler);
                        bridge.addEventListener(SWFBridgeRequest.DEACTIVATE_FOCUS_REQUEST, focusRequestDeactivateHandler);
                        bridge.addEventListener(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE, bridgeEventActivateHandler);
                    }
                    container.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
                }
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        private function dispatchSetShowFocusIndicatorRequest(param1:Boolean, param2:IEventDispatcher) : void
        {
            var _loc_3:* = new SWFBridgeRequest(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST, false, false, null, param1);
            dispatchEventFromSWFBridges(_loc_3, param2);
            return;
        }// end function

        private function creationCompleteHandler(event:FlexEvent) : void
        {
            var _loc_2:* = DisplayObject(form);
            if (_loc_2.parent && _loc_2.visible && !activated)
            {
                form.systemManager.activate(form);
            }
            return;
        }// end function

        private function addFocusables(param1:DisplayObject, param2:Boolean = false) : void
        {
            var addToFocusables:Boolean;
            var focusable:IFocusManagerComponent;
            var doc:DisplayObjectContainer;
            var rawChildren:IChildList;
            var i:int;
            var o:* = param1;
            var skipTopLevel:* = param2;
            if (o is IFocusManagerComponent && !skipTopLevel)
            {
                addToFocusables;
                if (o is IFocusManagerComponent)
                {
                    focusable = IFocusManagerComponent(o);
                    if (focusable.focusEnabled)
                    {
                        if (focusable.tabEnabled && isTabVisible(o))
                        {
                            addToFocusables;
                        }
                    }
                }
                if (addToFocusables)
                {
                    if (focusableObjects.indexOf(o) == -1)
                    {
                        focusableObjects.push(o);
                        calculateCandidates = true;
                    }
                    o.addEventListener("tabEnabledChange", tabEnabledChangeHandler);
                    o.addEventListener("tabIndexChange", tabIndexChangeHandler);
                }
            }
            if (o is DisplayObjectContainer)
            {
                doc = DisplayObjectContainer(o);
                o.addEventListener("tabChildrenChange", tabChildrenChangeHandler);
                if (doc.tabChildren)
                {
                    if (o is IRawChildrenContainer)
                    {
                        rawChildren = IRawChildrenContainer(o).mx.core:IRawChildrenContainer::rawChildren;
                        i;
                        while (i < rawChildren.numChildren)
                        {
                            
                            try
                            {
                                addFocusables(rawChildren.getChildAt(i));
                            }
                            catch (error:SecurityError)
                            {
                            }
                            i = (i + 1);
                        }
                    }
                    else
                    {
                        i;
                        while (i < doc.numChildren)
                        {
                            
                            try
                            {
                                addFocusables(doc.getChildAt(i));
                            }
                            catch (error:SecurityError)
                            {
                            }
                            i = (i + 1);
                        }
                    }
                }
            }
            return;
        }// end function

        private function tabEnabledChangeHandler(event:Event) : void
        {
            calculateCandidates = true;
            var _loc_2:* = InteractiveObject(event.target);
            var _loc_3:* = focusableObjects.length;
            var _loc_4:* = 0;
            while (_loc_4 < _loc_3)
            {
                
                if (focusableObjects[_loc_4] == _loc_2)
                {
                    break;
                }
                _loc_4++;
            }
            if (_loc_2.tabEnabled)
            {
                if (_loc_4 == _loc_3 && isTabVisible(_loc_2))
                {
                    if (focusableObjects.indexOf(_loc_2) == -1)
                    {
                        focusableObjects.push(_loc_2);
                    }
                }
            }
            else if (_loc_4 < _loc_3)
            {
                focusableObjects.splice(_loc_4, 1);
            }
            return;
        }// end function

        private function mouseFocusChangeHandler(event:FocusEvent) : void
        {
            var _loc_2:* = null;
            if (event.relatedObject == null && "isRelatedObjectInaccessible" in event && event["isRelatedObjectInaccessible"] == true)
            {
                return;
            }
            if (event.relatedObject is TextField)
            {
                _loc_2 = event.relatedObject as TextField;
                if (_loc_2.type == "input" || _loc_2.selectable)
                {
                    return;
                }
            }
            event.preventDefault();
            return;
        }// end function

        public function addSWFBridge(param1:IEventDispatcher, param2:DisplayObject) : void
        {
            if (!param2)
            {
                return;
            }
            var _loc_3:* = _form.systemManager;
            if (focusableObjects.indexOf(param2) == -1)
            {
                focusableObjects.push(param2);
                calculateCandidates = true;
            }
            swfBridgeGroup.addChildBridge(param1, ISWFBridgeProvider(param2));
            param1.addEventListener(SWFBridgeRequest.MOVE_FOCUS_REQUEST, focusRequestMoveHandler);
            param1.addEventListener(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST, setShowFocusIndicatorRequestHandler);
            param1.addEventListener(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE, bridgeEventActivateHandler);
            return;
        }// end function

        private function getChildIndex(param1:DisplayObjectContainer, param2:DisplayObject) : int
        {
            var parent:* = param1;
            var child:* = param2;
            try
            {
                return parent.getChildIndex(child);
            }
            catch (e:Error)
            {
                if (parent is IRawChildrenContainer)
                {
                    return IRawChildrenContainer(parent).mx.core:IRawChildrenContainer::rawChildren.getChildIndex(child);
                }
                throw e;
            }
            throw new Error("FocusManager.getChildIndex failed");
        }// end function

        private function bridgeEventActivateHandler(event:Event) : void
        {
            if (event is SWFBridgeEvent)
            {
                return;
            }
            lastActiveFocusManager = null;
            _lastFocus = null;
            dispatchActivatedFocusManagerEvent(IEventDispatcher(event.target));
            return;
        }// end function

        private function focusOutHandler(event:FocusEvent) : void
        {
            var _loc_2:* = InteractiveObject(event.target);
            return;
        }// end function

        private function isValidFocusCandidate(param1:DisplayObject, param2:String) : Boolean
        {
            var _loc_3:* = null;
            if (!isEnabledAndVisible(param1))
            {
                return false;
            }
            if (param1 is IFocusManagerGroup)
            {
                _loc_3 = IFocusManagerGroup(param1);
                if (param2 == _loc_3.groupName)
                {
                    return false;
                }
            }
            return true;
        }// end function

        private function defaultButtonKeyHandler(event:KeyboardEvent) : void
        {
            var _loc_2:* = form.systemManager;
            if (_loc_2.isDisplayObjectInABridgedApplication(DisplayObject(event.target)))
            {
                return;
            }
            if (defaultButtonEnabled && event.keyCode == Keyboard.ENTER && defaultButton && defButton.enabled)
            {
                sendDefaultButtonEvent();
            }
            return;
        }// end function

        private function removeFocusables(param1:DisplayObject, param2:Boolean) : void
        {
            var _loc_3:* = 0;
            if (param1 is DisplayObjectContainer)
            {
                if (!param2)
                {
                    param1.removeEventListener("tabChildrenChange", tabChildrenChangeHandler);
                }
                _loc_3 = 0;
                while (_loc_3 < focusableObjects.length)
                {
                    
                    if (isParent(DisplayObjectContainer(param1), focusableObjects[_loc_3]))
                    {
                        if (focusableObjects[_loc_3] == _lastFocus)
                        {
                            _lastFocus.drawFocus(false);
                            _lastFocus = null;
                        }
                        focusableObjects[_loc_3].removeEventListener("tabEnabledChange", tabEnabledChangeHandler);
                        focusableObjects[_loc_3].removeEventListener("tabIndexChange", tabIndexChangeHandler);
                        focusableObjects.splice(_loc_3, 1);
                        _loc_3 = _loc_3 - 1;
                        focusableCandidates = [];
                        calculateCandidates = true;
                    }
                    _loc_3++;
                }
            }
            return;
        }// end function

        private function addedHandler(event:Event) : void
        {
            var _loc_2:* = DisplayObject(event.target);
            if (_loc_2.stage)
            {
                addFocusables(DisplayObject(event.target));
            }
            return;
        }// end function

        private function tabChildrenChangeHandler(event:Event) : void
        {
            if (event.target != event.currentTarget)
            {
                return;
            }
            calculateCandidates = true;
            var _loc_2:* = DisplayObjectContainer(event.target);
            if (_loc_2.tabChildren)
            {
                addFocusables(_loc_2, true);
            }
            else
            {
                removeFocusables(_loc_2, true);
            }
            return;
        }// end function

        private function sortByDepth(param1:DisplayObject, param2:DisplayObject) : Number
        {
            var _loc_5:* = 0;
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_3:* = "";
            var _loc_4:* = "";
            var _loc_8:* = "0000";
            var _loc_9:* = DisplayObject(param1);
            var _loc_10:* = DisplayObject(param2);
            while (_loc_9 != DisplayObject(form) && _loc_9.parent)
            {
                
                _loc_5 = getChildIndex(_loc_9.parent, _loc_9);
                _loc_6 = _loc_5.toString(16);
                if (_loc_6.length < 4)
                {
                    _loc_7 = _loc_8.substring(0, 4 - _loc_6.length) + _loc_6;
                }
                _loc_3 = _loc_7 + _loc_3;
                _loc_9 = _loc_9.parent;
            }
            while (_loc_10 != DisplayObject(form) && _loc_10.parent)
            {
                
                _loc_5 = getChildIndex(_loc_10.parent, _loc_10);
                _loc_6 = _loc_5.toString(16);
                if (_loc_6.length < 4)
                {
                    _loc_7 = _loc_8.substring(0, 4 - _loc_6.length) + _loc_6;
                }
                _loc_4 = _loc_7 + _loc_4;
                _loc_10 = _loc_10.parent;
            }
            return _loc_3 > _loc_4 ? (1) : (_loc_3 < _loc_4 ? (-1) : (0));
        }// end function

        function sendDefaultButtonEvent() : void
        {
            defButton.dispatchEvent(new MouseEvent("click"));
            return;
        }// end function

        public function getFocus() : IFocusManagerComponent
        {
            var _loc_1:* = form.systemManager.stage.focus;
            return findFocusManagerComponent(_loc_1);
        }// end function

        private function deactivateHandler(event:Event) : void
        {
            return;
        }// end function

        private function setFocusToBottom() : void
        {
            setFocusToNextIndex(focusableObjects.length, true);
            return;
        }// end function

        private function tabIndexChangeHandler(event:Event) : void
        {
            calculateCandidates = true;
            return;
        }// end function

        private function sortFocusableObjects() : void
        {
            var _loc_3:* = null;
            focusableCandidates = [];
            var _loc_1:* = focusableObjects.length;
            var _loc_2:* = 0;
            while (_loc_2 < _loc_1)
            {
                
                _loc_3 = focusableObjects[_loc_2];
                if (_loc_3.tabIndex && !isNaN(Number(_loc_3.tabIndex)) && _loc_3.tabIndex > 0)
                {
                    sortFocusableObjectsTabIndex();
                    return;
                }
                focusableCandidates.push(_loc_3);
                _loc_2++;
            }
            focusableCandidates.sort(sortByDepth);
            return;
        }// end function

        private function keyFocusChangeHandler(event:FocusEvent) : void
        {
            var _loc_2:* = form.systemManager;
            if (_loc_2.isDisplayObjectInABridgedApplication(DisplayObject(event.target)))
            {
                return;
            }
            showFocusIndicator = true;
            focusChanged = false;
            if (event.keyCode == Keyboard.TAB && !event.isDefaultPrevented())
            {
                if (browserFocusComponent)
                {
                    if (browserFocusComponent.tabIndex == LARGE_TAB_INDEX)
                    {
                        browserFocusComponent.tabIndex = -1;
                    }
                    browserFocusComponent = null;
                    if (SystemManager(form.systemManager).useSWFBridge())
                    {
                        moveFocusToParent(event.shiftKey);
                        if (focusChanged)
                        {
                            event.preventDefault();
                        }
                    }
                    return;
                }
                setFocusToNextObject(event);
                if (focusChanged)
                {
                    event.preventDefault();
                }
            }
            return;
        }// end function

        private function getNextFocusManagerComponent2(param1:Boolean = false, param2:DisplayObject = null, param3:int = -2) : FocusInfo
        {
            var _loc_10:* = null;
            var _loc_11:* = null;
            var _loc_12:* = null;
            if (focusableObjects.length == 0)
            {
                return null;
            }
            if (calculateCandidates)
            {
                sortFocusableObjects();
                calculateCandidates = false;
            }
            var _loc_4:* = param3;
            if (param3 == FROM_INDEX_UNSPECIFIED)
            {
                _loc_10 = param2;
                if (!_loc_10)
                {
                    _loc_10 = form.systemManager.stage.focus;
                }
                _loc_10 = DisplayObject(findFocusManagerComponent2(InteractiveObject(_loc_10)));
                _loc_11 = "";
                if (_loc_10 is IFocusManagerGroup)
                {
                    _loc_12 = IFocusManagerGroup(_loc_10);
                    _loc_11 = _loc_12.groupName;
                }
                _loc_4 = getIndexOfFocusedObject(_loc_10);
            }
            var _loc_5:* = false;
            var _loc_6:* = _loc_4;
            if (_loc_4 == -1)
            {
                if (param1)
                {
                    _loc_4 = focusableCandidates.length;
                }
                _loc_5 = true;
            }
            var _loc_7:* = getIndexOfNextObject(_loc_4, param1, _loc_5, _loc_11);
            var _loc_8:* = false;
            if (param1)
            {
                if (_loc_7 >= _loc_4)
                {
                    _loc_8 = true;
                }
            }
            else if (_loc_7 <= _loc_4)
            {
                _loc_8 = true;
            }
            var _loc_9:* = new FocusInfo();
            _loc_9.displayObject = findFocusManagerComponent2(focusableCandidates[_loc_7]);
            _loc_9.wrapped = _loc_8;
            return _loc_9;
        }// end function

        private function getIndexOfFocusedObject(param1:DisplayObject) : int
        {
            var _loc_4:* = null;
            if (!param1)
            {
                return -1;
            }
            var _loc_2:* = focusableCandidates.length;
            var _loc_3:* = 0;
            _loc_3 = 0;
            while (_loc_3 < _loc_2)
            {
                
                if (focusableCandidates[_loc_3] == param1)
                {
                    return _loc_3;
                }
                _loc_3++;
            }
            _loc_3 = 0;
            while (_loc_3 < _loc_2)
            {
                
                _loc_4 = focusableCandidates[_loc_3] as IUIComponent;
                if (_loc_4 && _loc_4.owns(param1))
                {
                    return _loc_3;
                }
                _loc_3++;
            }
            return -1;
        }// end function

        private function focusRequestActivateHandler(event:Event) : void
        {
            skipBridge = IEventDispatcher(event.target);
            activate();
            skipBridge = null;
            return;
        }// end function

        private function removeFromParentBridge(event:Event) : void
        {
            var _loc_3:* = null;
            var _loc_2:* = form.systemManager;
            if (_loc_2.useSWFBridge())
            {
                _loc_2.removeEventListener(SWFBridgeEvent.BRIDGE_APPLICATION_UNLOADING, removeFromParentBridge);
                _loc_3 = swfBridgeGroup.parentBridge;
                if (_loc_3)
                {
                    _loc_3.removeEventListener(SWFBridgeRequest.MOVE_FOCUS_REQUEST, focusRequestMoveHandler);
                    _loc_3.removeEventListener(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST, setShowFocusIndicatorRequestHandler);
                }
                if (_loc_3 && !(form.systemManager is SystemManagerProxy))
                {
                    _loc_3.removeEventListener(SWFBridgeRequest.ACTIVATE_FOCUS_REQUEST, focusRequestActivateHandler);
                    _loc_3.removeEventListener(SWFBridgeRequest.DEACTIVATE_FOCUS_REQUEST, focusRequestDeactivateHandler);
                    _loc_3.removeEventListener(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE, bridgeEventActivateHandler);
                }
            }
            return;
        }// end function

        private function getParentBridge() : IEventDispatcher
        {
            if (swfBridgeGroup)
            {
                return swfBridgeGroup.parentBridge;
            }
            return null;
        }// end function

        private function setFocusToComponent(param1:Object, param2:Boolean) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            focusChanged = false;
            if (param1)
            {
                if (param1 is ISWFLoader && ISWFLoader(param1).swfBridge)
                {
                    _loc_3 = new SWFBridgeRequest(SWFBridgeRequest.MOVE_FOCUS_REQUEST, false, true, null, param2 ? (FocusRequestDirection.BOTTOM) : (FocusRequestDirection.TOP));
                    _loc_4 = ISWFLoader(param1).swfBridge;
                    if (_loc_4)
                    {
                        _loc_4.dispatchEvent(_loc_3);
                        focusChanged = _loc_3.data;
                    }
                }
                else if (param1 is IFocusManagerComplexComponent)
                {
                    IFocusManagerComplexComponent(param1).assignFocus(param2 ? ("bottom") : ("top"));
                    focusChanged = true;
                }
                else if (param1 is IFocusManagerComponent)
                {
                    setFocus(IFocusManagerComponent(param1));
                    focusChanged = true;
                }
            }
            return;
        }// end function

        private function focusRequestMoveHandler(event:Event) : void
        {
            var _loc_3:* = null;
            if (event is SWFBridgeRequest)
            {
                return;
            }
            focusSetLocally = false;
            var _loc_2:* = SWFBridgeRequest.marshal(event);
            if (_loc_2.data == FocusRequestDirection.TOP || _loc_2.data == FocusRequestDirection.BOTTOM)
            {
                if (focusableObjects.length == 0)
                {
                    moveFocusToParent(_loc_2.data == FocusRequestDirection.TOP ? (false) : (true));
                    event["data"] = focusChanged;
                    return;
                }
                if (_loc_2.data == FocusRequestDirection.TOP)
                {
                    setFocusToTop();
                }
                else
                {
                    setFocusToBottom();
                }
                event["data"] = focusChanged;
            }
            else
            {
                _loc_3 = DisplayObject(_form.systemManager.swfBridgeGroup.getChildBridgeProvider(IEventDispatcher(event.target)));
                moveFocus(_loc_2.data as String, _loc_3);
                event["data"] = focusChanged;
            }
            if (focusSetLocally)
            {
                dispatchActivatedFocusManagerEvent(null);
                lastActiveFocusManager = this;
            }
            return;
        }// end function

        public function get nextTabIndex() : int
        {
            return (getMaxTabIndex() + 1);
        }// end function

        private function dispatchActivatedFocusManagerEvent(param1:IEventDispatcher = null) : void
        {
            if (lastActiveFocusManager == this)
            {
                return;
            }
            var _loc_2:* = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE);
            dispatchEventFromSWFBridges(_loc_2, param1);
            return;
        }// end function

        private function focusRequestDeactivateHandler(event:Event) : void
        {
            skipBridge = IEventDispatcher(event.target);
            deactivate();
            skipBridge = null;
            return;
        }// end function

        public function get focusPane() : Sprite
        {
            return _focusPane;
        }// end function

        private function keyDownHandler(event:KeyboardEvent) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = 0;
            var _loc_6:* = 0;
            var _loc_7:* = null;
            var _loc_2:* = form.systemManager;
            if (_loc_2.isDisplayObjectInABridgedApplication(DisplayObject(event.target)))
            {
                return;
            }
            if (_loc_2 is SystemManager)
            {
                SystemManager(_loc_2).idleCounter = 0;
            }
            if (event.keyCode == Keyboard.TAB)
            {
                lastAction = "KEY";
                if (calculateCandidates)
                {
                    sortFocusableObjects();
                    calculateCandidates = false;
                }
            }
            if (browserMode)
            {
                if (event.keyCode == Keyboard.TAB && focusableCandidates.length > 0)
                {
                    _loc_3 = fauxFocus;
                    if (!_loc_3)
                    {
                        _loc_3 = _loc_2.stage.focus;
                    }
                    _loc_3 = DisplayObject(findFocusManagerComponent2(InteractiveObject(_loc_3)));
                    _loc_4 = "";
                    if (_loc_3 is IFocusManagerGroup)
                    {
                        _loc_7 = IFocusManagerGroup(_loc_3);
                        _loc_4 = _loc_7.groupName;
                    }
                    _loc_5 = getIndexOfFocusedObject(_loc_3);
                    _loc_6 = getIndexOfNextObject(_loc_5, event.shiftKey, false, _loc_4);
                    if (event.shiftKey)
                    {
                        if (_loc_6 >= _loc_5)
                        {
                            browserFocusComponent = getBrowserFocusComponent(event.shiftKey);
                            if (browserFocusComponent.tabIndex == -1)
                            {
                                browserFocusComponent.tabIndex = 0;
                            }
                        }
                    }
                    else if (_loc_6 <= _loc_5)
                    {
                        browserFocusComponent = getBrowserFocusComponent(event.shiftKey);
                        if (browserFocusComponent.tabIndex == -1)
                        {
                            browserFocusComponent.tabIndex = LARGE_TAB_INDEX;
                        }
                    }
                }
            }
            return;
        }// end function

        private function mouseDownHandler(event:MouseEvent) : void
        {
            if (event.isDefaultPrevented())
            {
                return;
            }
            var _loc_2:* = form.systemManager;
            var _loc_3:* = getTopLevelFocusTarget(InteractiveObject(event.target));
            if (!_loc_3)
            {
                return;
            }
            showFocusIndicator = false;
            if ((_loc_3 != _lastFocus || lastAction == "ACTIVATE") && !(_loc_3 is TextField))
            {
                setFocus(IFocusManagerComponent(_loc_3));
            }
            else if (_lastFocus)
            {
                if (!_lastFocus && _loc_3 is IEventDispatcher && SystemManager(form.systemManager).useSWFBridge())
                {
                    IEventDispatcher(_loc_3).dispatchEvent(new FocusEvent(FocusEvent.FOCUS_IN));
                }
            }
            lastAction = "MOUSEDOWN";
            dispatchActivatedFocusManagerEvent(null);
            lastActiveFocusManager = this;
            return;
        }// end function

        private function focusInHandler(event:FocusEvent) : void
        {
            var _loc_4:* = null;
            var _loc_2:* = InteractiveObject(event.target);
            var _loc_3:* = form.systemManager;
            if (_loc_3.isDisplayObjectInABridgedApplication(DisplayObject(event.target)))
            {
                return;
            }
            if (isParent(DisplayObjectContainer(form), _loc_2))
            {
                _lastFocus = findFocusManagerComponent(InteractiveObject(_loc_2));
                if (_lastFocus is IButton && !(_lastFocus is IToggleButton))
                {
                    _loc_4 = _lastFocus as IButton;
                    if (defButton)
                    {
                        defButton.emphasized = false;
                        defButton = _loc_4;
                        _loc_4.emphasized = true;
                    }
                }
                else if (defButton && defButton != _defaultButton)
                {
                    defButton.emphasized = false;
                    defButton = _defaultButton;
                    if (_defaultButton)
                    {
                        _defaultButton.emphasized = true;
                    }
                }
            }
            return;
        }// end function

        public function toString() : String
        {
            return Object(form).toString() + ".focusManager";
        }// end function

        public function deactivate() : void
        {
            var _loc_1:* = form.systemManager;
            if (_loc_1)
            {
                if (_loc_1.isTopLevelRoot())
                {
                    _loc_1.stage.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, mouseFocusChangeHandler);
                    _loc_1.stage.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler);
                    _loc_1.stage.removeEventListener(Event.ACTIVATE, activateHandler);
                    _loc_1.stage.removeEventListener(Event.DEACTIVATE, deactivateHandler);
                }
                else
                {
                    _loc_1.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, mouseFocusChangeHandler);
                    _loc_1.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler);
                    _loc_1.removeEventListener(Event.ACTIVATE, activateHandler);
                    _loc_1.removeEventListener(Event.DEACTIVATE, deactivateHandler);
                }
            }
            form.removeEventListener(FocusEvent.FOCUS_IN, focusInHandler, true);
            form.removeEventListener(FocusEvent.FOCUS_OUT, focusOutHandler, true);
            form.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            form.removeEventListener(KeyboardEvent.KEY_DOWN, defaultButtonKeyHandler);
            form.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, true);
            activated = false;
            dispatchEventFromSWFBridges(new SWFBridgeRequest(SWFBridgeRequest.DEACTIVATE_FOCUS_REQUEST), skipBridge);
            return;
        }// end function

        private function findFocusManagerComponent2(param1:InteractiveObject) : DisplayObject
        {
            var o:* = param1;
            try
            {
                while (o)
                {
                    
                    if (o is IFocusManagerComponent && IFocusManagerComponent(o).focusEnabled || o is ISWFLoader)
                    {
                        return o;
                    }
                    o = o.parent;
                }
            }
            catch (error:SecurityError)
            {
            }
            return null;
        }// end function

        private function getIndexOfNextObject(param1:int, param2:Boolean, param3:Boolean, param4:String) : int
        {
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_9:* = 0;
            var _loc_10:* = null;
            var _loc_11:* = null;
            var _loc_5:* = focusableCandidates.length;
            var _loc_6:* = param1;
            while (true)
            {
                
                if (param2)
                {
                    param1 = param1 - 1;
                }
                else
                {
                    param1++;
                }
                if (param3)
                {
                    if (param2 && param1 < 0)
                    {
                        break;
                    }
                    if (!param2 && param1 == _loc_5)
                    {
                        break;
                    }
                }
                else
                {
                    param1 = (param1 + _loc_5) % _loc_5;
                    if (_loc_6 == param1)
                    {
                        break;
                    }
                    if (_loc_6 == -1)
                    {
                        _loc_6 = param1;
                    }
                }
                if (isValidFocusCandidate(focusableCandidates[param1], param4))
                {
                    _loc_7 = DisplayObject(findFocusManagerComponent2(focusableCandidates[param1]));
                    if (_loc_7 is IFocusManagerGroup)
                    {
                        _loc_8 = IFocusManagerGroup(_loc_7);
                        _loc_9 = 0;
                        while (_loc_9 < focusableCandidates.length)
                        {
                            
                            _loc_10 = focusableCandidates[_loc_9];
                            if (_loc_10 is IFocusManagerGroup)
                            {
                                _loc_11 = IFocusManagerGroup(_loc_10);
                                if (_loc_11.groupName == _loc_8.groupName && _loc_11.selected)
                                {
                                    if (InteractiveObject(_loc_10).tabIndex != InteractiveObject(_loc_7).tabIndex && !_loc_8.selected)
                                    {
                                        return getIndexOfNextObject(param1, param2, param3, param4);
                                    }
                                    param1 = _loc_9;
                                    break;
                                }
                            }
                            _loc_9++;
                        }
                    }
                    return param1;
                }
            }
            return param1;
        }// end function

        public function moveFocus(param1:String, param2:DisplayObject = null) : void
        {
            if (param1 == FocusRequestDirection.TOP)
            {
                setFocusToTop();
                return;
            }
            if (param1 == FocusRequestDirection.BOTTOM)
            {
                setFocusToBottom();
                return;
            }
            var _loc_3:* = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
            _loc_3.keyCode = Keyboard.TAB;
            _loc_3.shiftKey = param1 == FocusRequestDirection.FORWARD ? (false) : (true);
            fauxFocus = param2;
            keyDownHandler(_loc_3);
            var _loc_4:* = new FocusEvent(FocusEvent.KEY_FOCUS_CHANGE);
            _loc_4.keyCode = Keyboard.TAB;
            _loc_4.shiftKey = param1 == FocusRequestDirection.FORWARD ? (false) : (true);
            keyFocusChangeHandler(_loc_4);
            fauxFocus = null;
            return;
        }// end function

        private function getMaxTabIndex() : int
        {
            var _loc_4:* = NaN;
            var _loc_1:* = 0;
            var _loc_2:* = focusableObjects.length;
            var _loc_3:* = 0;
            while (_loc_3 < _loc_2)
            {
                
                _loc_4 = focusableObjects[_loc_3].tabIndex;
                if (!isNaN(_loc_4))
                {
                    _loc_1 = Math.max(_loc_1, _loc_4);
                }
                _loc_3++;
            }
            return _loc_1;
        }// end function

        private function isParent(param1:DisplayObjectContainer, param2:DisplayObject) : Boolean
        {
            if (param1 is IRawChildrenContainer)
            {
                return IRawChildrenContainer(param1).mx.core:IRawChildrenContainer::rawChildren.contains(param2);
            }
            return param1.contains(param2);
        }// end function

        private function showHandler(event:Event) : void
        {
            form.systemManager.activate(form);
            return;
        }// end function

        function set form(param1:IFocusManagerContainer) : void
        {
            _form = param1;
            return;
        }// end function

        public function setFocus(param1:IFocusManagerComponent) : void
        {
            param1.setFocus();
            focusSetLocally = true;
            return;
        }// end function

        public function findFocusManagerComponent(param1:InteractiveObject) : IFocusManagerComponent
        {
            return findFocusManagerComponent2(param1) as IFocusManagerComponent;
        }// end function

        public function removeSWFBridge(param1:IEventDispatcher) : void
        {
            var _loc_4:* = 0;
            var _loc_2:* = _form.systemManager;
            var _loc_3:* = DisplayObject(swfBridgeGroup.getChildBridgeProvider(param1));
            if (_loc_3)
            {
                _loc_4 = focusableObjects.indexOf(_loc_3);
                if (_loc_4 != -1)
                {
                    focusableObjects.splice(_loc_4, 1);
                    calculateCandidates = true;
                }
            }
            else
            {
                throw new Error();
            }
            param1.removeEventListener(SWFBridgeRequest.MOVE_FOCUS_REQUEST, focusRequestMoveHandler);
            param1.removeEventListener(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST, setShowFocusIndicatorRequestHandler);
            param1.removeEventListener(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE, bridgeEventActivateHandler);
            swfBridgeGroup.removeChildBridge(param1);
            return;
        }// end function

        private function sortFocusableObjectsTabIndex() : void
        {
            var _loc_3:* = null;
            focusableCandidates = [];
            var _loc_1:* = focusableObjects.length;
            var _loc_2:* = 0;
            while (_loc_2 < _loc_1)
            {
                
                _loc_3 = focusableObjects[_loc_2] as IFocusManagerComponent;
                if (_loc_3 && _loc_3.tabIndex && !isNaN(Number(_loc_3.tabIndex)) || focusableObjects[_loc_2] is ISWFLoader)
                {
                    focusableCandidates.push(focusableObjects[_loc_2]);
                }
                _loc_2++;
            }
            focusableCandidates.sort(sortByTabIndex);
            return;
        }// end function

        public function set defaultButton(param1:IButton) : void
        {
            var _loc_2:* = param1 ? (IButton(param1)) : (null);
            if (_loc_2 != _defaultButton)
            {
                if (_defaultButton)
                {
                    _defaultButton.emphasized = false;
                }
                if (defButton)
                {
                    defButton.emphasized = false;
                }
                _defaultButton = _loc_2;
                if (_lastFocus && _lastFocus is IButton && !(_lastFocus is IToggleButton))
                {
                    defButton = _lastFocus as IButton;
                    defButton.emphasized = true;
                }
                else
                {
                    defButton = _loc_2;
                    if (_loc_2)
                    {
                        _loc_2.emphasized = true;
                    }
                }
            }
            return;
        }// end function

        private function setFocusToNextObject(event:FocusEvent) : void
        {
            focusChanged = false;
            if (focusableObjects.length == 0)
            {
                return;
            }
            var _loc_2:* = getNextFocusManagerComponent2(event.shiftKey, fauxFocus);
            if (!popup && (_loc_2.wrapped || !_loc_2.displayObject))
            {
                if (getParentBridge())
                {
                    moveFocusToParent(event.shiftKey);
                    return;
                }
            }
            if (!_loc_2.displayObject)
            {
                event.preventDefault();
                return;
            }
            setFocusToComponent(_loc_2.displayObject, event.shiftKey);
            return;
        }// end function

        private function getTopLevelFocusTarget(param1:InteractiveObject) : InteractiveObject
        {
            while (param1 != InteractiveObject(form))
            {
                
                if (param1 is IFocusManagerComponent && IFocusManagerComponent(param1).focusEnabled && IFocusManagerComponent(param1).mouseFocusEnabled && (param1 is IUIComponent ? (IUIComponent(param1).enabled) : (true)))
                {
                    return param1;
                }
                if (param1.parent is ISWFLoader)
                {
                    if (ISWFLoader(param1.parent).swfBridge)
                    {
                        return null;
                    }
                }
                param1 = param1.parent;
                if (param1 == null)
                {
                    break;
                }
            }
            return null;
        }// end function

        private function addedToStageHandler(event:Event) : void
        {
            _form.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
            if (focusableObjects.length == 0)
            {
                addFocusables(DisplayObject(_form));
                calculateCandidates = true;
            }
            return;
        }// end function

        private function hideHandler(event:Event) : void
        {
            form.systemManager.deactivate(form);
            return;
        }// end function

        private function isEnabledAndVisible(param1:DisplayObject) : Boolean
        {
            var _loc_2:* = DisplayObject(form).parent;
            while (param1 != _loc_2)
            {
                
                if (param1 is IUIComponent)
                {
                    if (!IUIComponent(param1).enabled)
                    {
                        return false;
                    }
                }
                if (!param1.visible)
                {
                    return false;
                }
                param1 = param1.parent;
            }
            return true;
        }// end function

        public function hideFocus() : void
        {
            if (showFocusIndicator)
            {
                showFocusIndicator = false;
                if (_lastFocus)
                {
                    _lastFocus.drawFocus(false);
                }
            }
            return;
        }// end function

        private function getBrowserFocusComponent(param1:Boolean) : InteractiveObject
        {
            var _loc_3:* = 0;
            var _loc_2:* = form.systemManager.stage.focus;
            if (!_loc_2)
            {
                _loc_3 = param1 ? (0) : ((focusableCandidates.length - 1));
                _loc_2 = focusableCandidates[_loc_3];
            }
            return _loc_2;
        }// end function

        public function get showFocusIndicator() : Boolean
        {
            return _showFocusIndicator;
        }// end function

        private function moveFocusToParent(param1:Boolean) : Boolean
        {
            var _loc_2:* = new SWFBridgeRequest(SWFBridgeRequest.MOVE_FOCUS_REQUEST, false, true, null, param1 ? (FocusRequestDirection.BACKWARD) : (FocusRequestDirection.FORWARD));
            var _loc_3:* = _form.systemManager.swfBridgeGroup.parentBridge;
            _loc_3.dispatchEvent(_loc_2);
            focusChanged = _loc_2.data;
            return focusChanged;
        }// end function

        public function set focusPane(param1:Sprite) : void
        {
            _focusPane = param1;
            return;
        }// end function

        function get form() : IFocusManagerContainer
        {
            return _form;
        }// end function

        private function removedHandler(event:Event) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = DisplayObject(event.target);
            var _loc_4:* = focusPane ? (focusPane.parent) : (null);
            if (_loc_4 && _loc_3 != focusPane)
            {
                if (_loc_3 is DisplayObjectContainer && isParent(DisplayObjectContainer(_loc_3), focusPane))
                {
                    if (_loc_4 is ISystemManager)
                    {
                        ISystemManager(_loc_4).focusPane = null;
                    }
                    else
                    {
                        IUIComponent(_loc_4).focusPane = null;
                    }
                }
            }
            if (_loc_3 is IFocusManagerComponent)
            {
                _loc_2 = 0;
                while (_loc_2 < focusableObjects.length)
                {
                    
                    if (_loc_3 == focusableObjects[_loc_2])
                    {
                        if (_loc_3 == _lastFocus)
                        {
                            _lastFocus.drawFocus(false);
                            _lastFocus = null;
                        }
                        _loc_3.removeEventListener("tabEnabledChange", tabEnabledChangeHandler);
                        _loc_3.removeEventListener("tabIndexChange", tabIndexChangeHandler);
                        focusableObjects.splice(_loc_2, 1);
                        focusableCandidates = [];
                        calculateCandidates = true;
                        break;
                    }
                    _loc_2++;
                }
            }
            removeFocusables(_loc_3, false);
            return;
        }// end function

        private function dispatchEventFromSWFBridges(event:Event, param2:IEventDispatcher = null) : void
        {
            var _loc_3:* = null;
            var _loc_7:* = null;
            var _loc_4:* = form.systemManager;
            if (!popup)
            {
                _loc_7 = swfBridgeGroup.parentBridge;
                if (_loc_7 && _loc_7 != param2)
                {
                    _loc_3 = event.clone();
                    if (_loc_3 is SWFBridgeRequest)
                    {
                        SWFBridgeRequest(_loc_3).requestor = _loc_7;
                    }
                    _loc_7.dispatchEvent(_loc_3);
                }
            }
            var _loc_5:* = swfBridgeGroup.getChildBridges();
            var _loc_6:* = 0;
            while (_loc_6 < _loc_5.length)
            {
                
                if (_loc_5[_loc_6] != param2)
                {
                    _loc_3 = event.clone();
                    if (_loc_3 is SWFBridgeRequest)
                    {
                        SWFBridgeRequest(_loc_3).requestor = IEventDispatcher(_loc_5[_loc_6]);
                    }
                    IEventDispatcher(_loc_5[_loc_6]).dispatchEvent(_loc_3);
                }
                _loc_6++;
            }
            return;
        }// end function

        public function get defaultButton() : IButton
        {
            return _defaultButton;
        }// end function

        private function activateHandler(event:Event) : void
        {
            if (_lastFocus && !browserMode)
            {
                _lastFocus.setFocus();
            }
            lastAction = "ACTIVATE";
            return;
        }// end function

        public function showFocus() : void
        {
            if (!showFocusIndicator)
            {
                showFocusIndicator = true;
                if (_lastFocus)
                {
                    _lastFocus.drawFocus(true);
                }
            }
            return;
        }// end function

        public function getNextFocusManagerComponent(param1:Boolean = false) : IFocusManagerComponent
        {
            return getNextFocusManagerComponent2(param1, fauxFocus).displayObject as IFocusManagerComponent;
        }// end function

        private function setShowFocusIndicatorRequestHandler(event:Event) : void
        {
            if (event is SWFBridgeRequest)
            {
                return;
            }
            var _loc_2:* = SWFBridgeRequest.marshal(event);
            _showFocusIndicator = _loc_2.data;
            dispatchSetShowFocusIndicatorRequest(_showFocusIndicator, IEventDispatcher(event.target));
            return;
        }// end function

        private function setFocusToTop() : void
        {
            setFocusToNextIndex(-1, false);
            return;
        }// end function

        private function isTabVisible(param1:DisplayObject) : Boolean
        {
            var _loc_2:* = DisplayObject(form.systemManager);
            if (!_loc_2)
            {
                return false;
            }
            var _loc_3:* = param1.parent;
            while (_loc_3 && _loc_3 != _loc_2)
            {
                
                if (!_loc_3.tabChildren)
                {
                    return false;
                }
                _loc_3 = _loc_3.parent;
            }
            return true;
        }// end function

        function get lastFocus() : IFocusManagerComponent
        {
            return _lastFocus;
        }// end function

        public function set defaultButtonEnabled(param1:Boolean) : void
        {
            _defaultButtonEnabled = param1;
            return;
        }// end function

        public function get defaultButtonEnabled() : Boolean
        {
            return _defaultButtonEnabled;
        }// end function

        public function set showFocusIndicator(param1:Boolean) : void
        {
            var _loc_2:* = _showFocusIndicator != param1;
            _showFocusIndicator = param1;
            if (_loc_2 && !popup && form.systemManager.swfBridgeGroup)
            {
                dispatchSetShowFocusIndicatorRequest(param1, null);
            }
            return;
        }// end function

        private function sortByTabIndex(param1:InteractiveObject, param2:InteractiveObject) : int
        {
            var _loc_3:* = param1.tabIndex;
            var _loc_4:* = param2.tabIndex;
            if (_loc_3 == -1)
            {
                _loc_3 = int.MAX_VALUE;
            }
            if (_loc_4 == -1)
            {
                _loc_4 = int.MAX_VALUE;
            }
            return _loc_3 > _loc_4 ? (1) : (_loc_3 < _loc_4 ? (-1) : (sortByDepth(DisplayObject(param1), DisplayObject(param2))));
        }// end function

        public function activate() : void
        {
            if (activated)
            {
                return;
            }
            var _loc_1:* = form.systemManager;
            if (_loc_1)
            {
                if (_loc_1.isTopLevelRoot())
                {
                    _loc_1.stage.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, mouseFocusChangeHandler, false, 0, true);
                    _loc_1.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler, false, 0, true);
                    _loc_1.stage.addEventListener(Event.ACTIVATE, activateHandler, false, 0, true);
                    _loc_1.stage.addEventListener(Event.DEACTIVATE, deactivateHandler, false, 0, true);
                }
                else
                {
                    _loc_1.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, mouseFocusChangeHandler, false, 0, true);
                    _loc_1.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler, false, 0, true);
                    _loc_1.addEventListener(Event.ACTIVATE, activateHandler, false, 0, true);
                    _loc_1.addEventListener(Event.DEACTIVATE, deactivateHandler, false, 0, true);
                }
            }
            form.addEventListener(FocusEvent.FOCUS_IN, focusInHandler, true);
            form.addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler, true);
            form.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            form.addEventListener(KeyboardEvent.KEY_DOWN, defaultButtonKeyHandler);
            form.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, true);
            activated = true;
            if (_lastFocus)
            {
                setFocus(_lastFocus);
            }
            dispatchEventFromSWFBridges(new SWFBridgeRequest(SWFBridgeRequest.ACTIVATE_FOCUS_REQUEST), skipBridge);
            return;
        }// end function

        private function setFocusToNextIndex(param1:int, param2:Boolean) : void
        {
            if (focusableObjects.length == 0)
            {
                return;
            }
            if (calculateCandidates)
            {
                sortFocusableObjects();
                calculateCandidates = false;
            }
            var _loc_3:* = getNextFocusManagerComponent2(param2, null, param1);
            if (!popup && _loc_3.wrapped)
            {
                if (getParentBridge())
                {
                    moveFocusToParent(param2);
                    return;
                }
            }
            setFocusToComponent(_loc_3.displayObject, param2);
            return;
        }// end function

    }
}

import flash.display.*;

import flash.events.*;

import flash.system.*;

import flash.text.*;

import flash.ui.*;

import mx.core.*;

import mx.events.*;

import mx.managers.*;

class FocusInfo extends Object
{
    public var displayObject:DisplayObject;
    public var wrapped:Boolean;

    function FocusInfo()
    {
        return;
    }// end function

}

