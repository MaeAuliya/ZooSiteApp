import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/res/typography.dart';
import '../../../image_classification/presentation/screens/classification_screen.dart';
import '../bloc/home_bloc.dart';
import '../providers/home_provider.dart';
import '../widgets/home_header_button.dart';

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, provider, __) => SizedBox(
        height: context.height * 0.4,
        width: context.width,
        child: Stack(
          children: [
            Positioned(
              top: context.height * 0.4 - context.heightScale * 564,
              left: context.width - context.widthScale * 564,
              right: context.width - context.widthScale * 564,
              child: Container(
                height: context.heightScale * 564,
                width: context.width,
                decoration: BoxDecoration(
                  gradient: Colours.primaryGradient,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 24,
              child: SvgPicture.asset(
                MediaRes.leaf1Vectors,
              ),
            ),
            Positioned(
              bottom: 48,
              right: 0,
              child: SvgPicture.asset(
                MediaRes.leaf2Vectors,
              ),
            ),
            Positioned(
              bottom: context.heightScale * 12,
              left: context.widthScale * 48,
              child: HomeHeaderButton(
                onTap: () {
                  provider.back();
                },
                isNext: false,
              ),
            ),
            Positioned(
              bottom: context.heightScale * 12,
              right: context.widthScale * 48,
              child: HomeHeaderButton(
                onTap: () {
                  provider.next();
                },
                isNext: true,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsetsGeometry.only(bottom: context.heightScale * 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CoreTypography.coreText(
                      text: 'Jelajahi Kebun Binatang Lewat',
                      fontSize: 16,
                      color: Colours.whiteColor,
                    ),
                    CoreTypography.coreText(
                      text: provider.headerTitle,
                      fontSize: 24,
                      color: Colours.whiteColor,
                      fontWeight: CoreTypography.bold,
                    ),
                    SizedBox(
                      height: context.heightScale * 14,
                    ),
                    GestureDetector(
                      onTap: (){
                        if (provider.currentHeader == 1){
                          context.homeBloc.add(OpenImageSourceBottomSheetEvent());
                        }
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            provider.headerIcon,
                            width: context.widthScale * 148,
                            height: context.widthScale * 148,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            height: context.heightScale * 14,
                          ),
                          CoreTypography.coreText(
                            text: 'Klik Disini!',
                            color: Colours.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
