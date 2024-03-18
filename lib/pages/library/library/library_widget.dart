import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/appbar/appbar_widget.dart';
import '/pages/components/sidebar/sidebar_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'library_model.dart';
export 'library_model.dart';

class LibraryWidget extends StatefulWidget {
  const LibraryWidget({super.key});

  @override
  State<LibraryWidget> createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {
  late LibraryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.sidebarModel,
                updateCallback: () => setState(() {}),
                child: const SidebarWidget(),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.appbarModel,
                            updateCallback: () => setState(() {}),
                            child: const AppbarWidget(),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 50.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 200.0,
                                      decoration: const BoxDecoration(),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 240.0,
                                        child: CarouselSlider(
                                          items: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('Readbook');
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIcu-xTA6s5Am7RKcrbHFcltDdlDjUutSZJw&usqp=CAU',
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('Readbook');
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://img.freepik.com/premium-psd/book-cover-design-mockup-template-with-podium-background-premium-psd_600732-63.jpg?w=360',
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('Readbook');
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHXG9vZkFeeUUnTls8z99qBcSF-wLVIgUxWmlTDaYUjd928rvr6k438fcgi5JoNEHkIyY&usqp=CAU',
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('Readbook');
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://i.pinimg.com/736x/69/80/87/6980877e4ec2b80e6c8afc0892f1be44.jpg',
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                          carouselController:
                                              _model.carouselController ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: 1,
                                            viewportFraction: 0.5,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                const Duration(milliseconds: 800),
                                            autoPlayInterval: const Duration(
                                                milliseconds: (800 + 4000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex = index,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 25.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 25.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 50.0;
                                              } else {
                                                return 50.0;
                                              }
                                            }(),
                                            0.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: GridView(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 3;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 4;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 6;
                                            } else {
                                              return 9;
                                            }
                                          }(),
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 0.6,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4fBh3vbGWNnZUtDlqRRv7eqmLM9KQe6tht4FMdVCu0LGjQnbrraw5Ux-UkUSxVq21ltM&usqp=CAU',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXQtNnyAQOF0l8CuHnGmto0Quly5QDtNj8-ofKCRDSst9o7-jHxYdj8r3CqEFr2iGQnBA&usqp=CAU',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqR9htTI7ARLLSDAT8yMVbACIEwSx05KSEzKeGc8II3A2FSI6Ou3KJvMflfAlqN9GtMLo&usqp=CAU',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcGPhZQ5z_9tgfoptOYmNqu89hRRYjkXDOfXmfzA2pAeg7KV0uyk3qs5h1654_UbkDPCc&usqp=CAU',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://thebookcoverdesigner.com/wp-content/uploads/2022/08/book-cover-147.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNJzMQsbSvzkRed6kxc_uJkvv4JUbw2dnfqQ&usqp=CAU',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://marketplace.canva.com/EAFXKFIDad4/1/0/1003w/canva-brown-mystery-novel-book-cover-cSu1pdo96zA.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://www.theentertainer.pk/cdn/shop/products/536717_20-_20disney_20-_20snow_20white_20story_20book.jpg?v=1687757471',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://cdnp.targetpublications.org/media/catalog/product/cache/f63311a2a00c092df9b3c20ab1a8a20f/1/2/12473_2_1.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://s26162.pcdn.co/wp-content/uploads/2022/12/worn-3-678x1024.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://edit.org/img/blog/vnl-1024-ebook-cover-maker-online-free-template.webp',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuewrpoMx04SFou7x5l8gzgi1-v3lrbeQqJQ&usqp=CAU',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Hanna_book_cover.jpg/170px-Hanna_book_cover.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'data:image/jpeg;base64,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',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Readbook');
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://d3ddkgxe55ca6c.cloudfront.net/assets/t1689689616/a/ad/73/210088-ml-2147076.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
