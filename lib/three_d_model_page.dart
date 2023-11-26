import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class ThreeDModelPage extends StatefulWidget {
  const ThreeDModelPage({super.key});

  @override
  State<ThreeDModelPage> createState() => _ThreeDModelPageState();
}

class _ThreeDModelPageState extends State<ThreeDModelPage> {
  O3DController controller = O3DController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My 3D Avatar"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          O3D(
              controller: controller,
              cameraControls: false,
              src:
                  "https://models.readyplayer.me/6512bdb81c810b0e7e6fc3c3.glb"),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    controller.cameraOrbit(0, 75, 70);
                    controller.cameraTarget(0, 0.95, -2.2);
                  },
                  child: const Icon(Icons.zoom_in),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        controller.cameraOrbit(90, 75, 70);
                        controller.cameraTarget(1, 1, 0);
                      },
                      child: const Icon(Icons.swipe_left_rounded),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        controller.cameraOrbit(0, 75, 70);
                        controller.cameraTarget(0, 0.87, 0);
                      },
                      child: const Icon(Icons.center_focus_strong),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        controller.cameraOrbit(-90, 75, 70);
                        controller.cameraTarget(-1, 1, 0);
                      },
                      child: const Icon(Icons.swipe_right_rounded),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    controller.cameraControls = true;
                  },
                  child: const Icon(Icons.threed_rotation),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
