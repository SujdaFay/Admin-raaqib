import 'package:flutter/material.dart';
import 'package:raaqib_admin_frontend/models/post_model.dart';
import 'package:raaqib_admin_frontend/widgets/pop_menue.dart';
import 'package:video_player/video_player.dart';

class PsotsWidget extends StatefulWidget {
  final PostModel post;
  const PsotsWidget({super.key, required this.post});

  @override
  State<PsotsWidget> createState() => _PsotsWidgetState();
}

class _PsotsWidgetState extends State<PsotsWidget> {
  late VideoPlayerController _playerController;
  double opacitt = 0;

  @override
  void initState() {
    // TODO: implement initState
    _playerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.post.video),
      )
      ..initialize().then((_) {
        _playerController.setLooping(true);
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    if (_playerController.value.isInitialized) {
      _playerController.dispose();
    }
    super.dispose();
  }

  //main================----------------------=====================
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.6),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // user Info
                Row(
                  children: [
                    CircleAvatar(radius: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SelectableText("UserID: ${widget.post.uid}"),
                        SelectableText("PostID: ${widget.post.id}"),
                      ],
                    ),

                    Expanded(child: PopMenueWidget(snap: widget.post)),
                  ],
                ),
                // video
                _playerController.value.isInitialized &&
                        _playerController.value != null
                    ? Stack(
                      alignment: Alignment.center,
                      children: [
                        // the video
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          // optional: background for any letterboxing
                          child: AspectRatio(
                            aspectRatio: _playerController.value.aspectRatio,
                            child: VideoPlayer(_playerController),
                          ),
                        ),

                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: opacitt,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_playerController.value.isPlaying) {
                                  opacitt = 1;
                                } else {
                                  opacitt = 0;
                                }
                              });
                              _playerController.value.isPlaying
                                  ? _playerController.pause()
                                  : _playerController.play();
                            },
                            icon: Icon(Icons.play_circle, size: 100),
                          ),
                        ),
                      ],
                    )
                    : Center(child: CircularProgressIndicator()),
                //images
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.post.imgs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.network(
                            fit: BoxFit.cover,
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            widget.post.imgs[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //
              ],
            ),
          );
        },
      ),
    );
  }
}
