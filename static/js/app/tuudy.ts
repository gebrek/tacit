function defaultScene(): Scene {
    return {
        things: [new Fourgon(new Point(0.0, 0.0),
			     new Point(0.0, 10.0),
			     new Point(10.0, 0.0),
			     new Point(10.0, 10.0))]
    }
}

function exec() {
    let canv = document.createElement("canvas");
    canv.width = 256;
    canv.height = 256;
    document.body.appendChild(canv);
    let ctx = canv.getContext("2d");
    let rayTracer = new RayTracer();
    return rayTracer.render(defaultScene(), ctx, 256, 256);
}
