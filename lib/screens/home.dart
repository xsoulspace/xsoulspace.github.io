import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xsoulspace/library/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({final Key? key}) : super(key: key);
  Widget buildAppBar(final BuildContext context) {
    final theme = Theme.of(context);
    final screenLayout = ScreenLayout.of(context);
    return Padding(
      padding: screenLayout.small
          ? const EdgeInsets.all(14)
          : const EdgeInsets.symmetric(horizontal: 14, vertical: 38),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 800,
          ),
          child: Row(
            children: [
              CupertinoButton(
                onPressed: () {},
                child: Text(
                  'XSoulSpace',
                  style: theme.textTheme.headline6?.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      child: const Text('Get in touch'),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: const Text('About'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final screenLayout = ScreenLayout.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildAppBar(context),
                  const SizedBox(height: 30),
                  // TODO(arenukvern): use wrap + card for small screens
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Wrap(
                      alignment: WrapAlignment.spaceAround,
                      spacing: 40,
                      runSpacing: 10,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Apps', style: theme.textTheme.headline6),
                        ),
                        TextButton(
                          child: const Text('Games'),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: const Text('Libraries'),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: const Text('Excel Addins'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  GridView(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          screenLayout.medium || screenLayout.small ? 1 : 2,
                      childAspectRatio: 3 / 4,
                      mainAxisExtent: 450,
                    ),
                    children: List<Widget>.generate(
                      1,
                      (final i) {
                        return Builder(
                          builder: (final context) {
                            return const ProjectPreviewCard();
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FrostContainer extends StatelessWidget {
  const FrostContainer({
    required final this.child,
    final Key? key,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.red),
      ),
      child: child,
    );
  }
}
