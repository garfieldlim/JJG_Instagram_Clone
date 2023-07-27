import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:igclone_flutter/state/auth/providers/auth_state_provider.dart';
import 'package:igclone_flutter/state/image_upload/helpers/image_picker_helper.dart';
import 'package:igclone_flutter/state/image_upload/models/file_type.dart';
import 'package:igclone_flutter/state/post_settings/providers/post_settings_provider.dart';
import 'package:igclone_flutter/views/components/dialogs/alert_dialog_model.dart';
import 'package:igclone_flutter/views/components/dialogs/logout_dialog.dart';
import 'package:igclone_flutter/views/create_new_post/create_new_post_view.dart';
import 'package:igclone_flutter/views/tabs/users_posts/user_posts_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Instagram Clone',
          ),
          actions: [
            IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.film,
                ),
                onPressed: () {}),
            IconButton(
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
              ),
              onPressed: () async {
                // pick an image first
                final imageFile =
                    await ImagePickerHelper.pickImageFromGallery();
                if (imageFile == null) {
                  return;
                }

                // reset the postSettingProvider
                ref.refresh(postSettingProvider);

                // go to the screen to create a new post
                if (!mounted) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileType: FileType.image,
                      fileToPost: imageFile,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () async {
                final shouldLogOut =
                    await const LogoutDialog().present(context).then(
                          (value) => value ?? false,
                        );
                if (shouldLogOut) {
                  await ref.read(authStateProvider.notifier).logOut();
                }
              },
              icon: const Icon(
                Icons.logout,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          UserPostsView(),
          UserPostsView(),
          UserPostsView(),
        ]),
      ),
    );
  }
}
