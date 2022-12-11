var World = {
    loaded: false,
    drawables: [],
    lights: [],
    firetruckRotation: {
        x: 0,
        y: 0,
        z: 0
    },
    firetruckCenter: {
        x: 0,
        y: -0.14,
        z: 0
    },
    firetruckLength: 0.33,
    firetruckHeight: 0.2,

    init: function initFn() {
        //World.createOccluder();
        World.createCap();
        World.createJerrycan();
        World.createOverlays();
        World.createTracker();
    },

    createOccluder: function createOccluderFn() {
        var occluderScale = 0.0065 * this.firetruckLength;

        this.firetruckOccluder = new AR.Occluder("assets/firetruck_occluder.wt3", {
            onLoaded: World.showInfoBar,
            scale: {
                x: occluderScale,
                y: occluderScale,
                z: occluderScale
            },
            translate: this.firetruckCenter,
            rotate: {
                x: 180
            },
            onError: World.onError
        });
        World.drawables.push(this.firetruckOccluder);
    },

    createCap: function createCapFn() {
        this.cap = World.getCap();
        World.drawables.push(this.cap);
    },

    getCap: function getCapFn() {
        var capScale = 0.003 * this.firetruckLength;
        return new AR.Model("assets/cap.wt3", {
            scale: {
                x: capScale,
                y: capScale,
                z: capScale
            },
            translate: {
                x: -this.firetruckLength * 0.8,
                y: 0,
                z: 0.2
            },
            rotate: {
                x: -90
            },
            onError: World.onError
        });
    },

    createJerrycan: function createJerrycanFn() {
        this.jerrycan = World.getJerrycan();
        World.drawables.push(this.jerrycan);
    },

    getJerrycan: function getJerrycanFn() {
        var jerrycanScale = 1.0 * this.firetruckLength;
        return new AR.Model("assets/jerrycan.wt3", {
            scale: {
                x: jerrycanScale,
                y: jerrycanScale,
                z: jerrycanScale
            },
            translate: {
                x: this.firetruckLength * 0.3,
                y: 0,
                z: 0.2
            },
            rotate: {
                x: -90
            },
            onClick: function () {
                World.runMainAnimation();
            },
            onError: World.onError
        });
    },

    runMainAnimation: function addMainAnimationFn() {
        var animationDuration = 2000;

        var capRotationAnimationY = new AR.PropertyAnimation(this.cap, "rotate.y", 0, 360, animationDuration);
        var capRotationAnimationX = new AR.PropertyAnimation(this.cap, "rotate.x", -90, -180, animationDuration);

        var jerrycanRotationAnimationDown = new AR.PropertyAnimation(this.jerrycan, "rotate.z", 0, 45, animationDuration);
        var jerrycanRotationAnimationUp = new AR.PropertyAnimation(this.jerrycan, "rotate.z", 45, 0, animationDuration);

        var animationGroup = new AR.AnimationGroup(
            AR.CONST.ANIMATION_GROUP_TYPE.SEQUENTIAL, [capRotationAnimationX, jerrycanRotationAnimationDown, jerrycanRotationAnimationUp]
        );
        animationGroup.start();
    },

    createTracker: function createTrackerFn() {
        this.targetCollectionResource = new AR.TargetCollectionResource("assets/firetruck.wto", {
            onError: World.onError
        });

        this.tracker = new AR.ObjectTracker(this.targetCollectionResource, {
            onError: World.onError
        });

        this.objectTrackable = new AR.ObjectTrackable(this.tracker, "*", {
            drawables: {
                cam: World.drawables
            },
            onObjectRecognized: World.objectRecognized,
            onObjectLost: World.objectLost,
            onError: World.onError
        });
    },

    createOverlays: function createOverlaysFn() {
        var instructionWidget = new AR.HtmlDrawable({
            uri: "assets/instruction.html"
        }, 0.25, {
            viewportWidth: 500,
            viewportHeight: 700,
            translate: {
                x: -this.firetruckLength * 0.5,
                y: this.firetruckHeight * 2,
                z: 0.2
            },
            rotate: {
                x: 25
            },
            horizontalAnchor: AR.CONST.HORIZONTAL_ANCHOR.RIGHT,
            verticalAnchor: AR.CONST.VERTICAL_ANCHOR.TOP,
            clickThroughEnabled: true,
            allowDocumentLocationChanges: false,
            onDocumentLocationChanged: function onDocumentLocationChangedFn(uri) {
                AR.context.openInBrowser(uri);
            },
            onError: World.onError
        });
        World.drawables.push(instructionWidget);

    },

    objectRecognized: function objectRecognizedFn() {
        World.hideInfoBar();
        World.setAugmentationsEnabled(true);
    },

    objectLost: function objectLostFn() {
        World.setAugmentationsEnabled(false);
    },

    setAugmentationsEnabled: function setAugmentationsEnabledFn(enabled) {
        for (var i = 0; i < World.drawables.length; i++) {
            World.drawables[i].enabled = enabled;
        }
    },

    onError: function onErrorFn(error) {
        alert(error);
    },

    hideInfoBar: function hideInfoBarFn() {
        document.getElementById("infoBox").style.display = "none";
    },

    showInfoBar: function worldLoadedFn() {
        document.getElementById("infoBox").style.display = "table";
        document.getElementById("loadingMessage").style.display = "none";
    }
};

World.init();