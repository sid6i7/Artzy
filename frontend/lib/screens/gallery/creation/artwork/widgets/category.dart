//TODO: fetch categories thru API call
import 'package:flutter/material.dart';
import 'package:frontend/models/category.dart';
import 'package:frontend/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:frontend/providers/gallery_creation.dart';

var categoryTags = [
  "Art",
  "Collectibles",
  "Clothing",
  "Shoes",
  "Toys",
  "Entertainment"
];

class CategoryWidget extends ConsumerStatefulWidget {
  const CategoryWidget({super.key});

  @override
  ConsumerState<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends ConsumerState<CategoryWidget> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final categoryList = ref.watch(artworkCategoryProvider);
    return Column(
      children: [
        TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: textController,
              onEditingComplete: () {
                ref
                    .read(artworkCategoryProvider.notifier)
                    .addCategory(Category(name: textController.text));
                textController.clear();
              },
              autofocus: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Label your creation",
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            suggestionsCallback: (String pattern) {
              return categoryTags.where((element) =>
                  element.toLowerCase().contains(pattern.toLowerCase()));
            },
            itemBuilder: ((context, itemData) {
              return ListTile(
                leading: const Icon(
                  Icons.tag,
                ),
                title: Text(itemData),
              );
            }),
            onSuggestionSelected: (suggestion) {
              suggestion = suggestion.toLowerCase().capitalize();
              if (categoryTags.contains(suggestion)) {
                ref
                    .read(artworkCategoryProvider.notifier)
                    .addCategory(Category(name: suggestion));
                categoryTags.remove(suggestion);
              }
            }),
        const SizedBox(
          height: 9,
        ),
        categoryList.isEmpty
            ? const Center(
                child: Text("No tag selected"),
              )
            : Wrap(
                children: categoryList
                    .map((category) => Padding(
                          padding: const EdgeInsets.all(2),
                          child: Chip(
                              label: Text(category.getName),
                              onDeleted: () {
                                ref
                                    .read(artworkCategoryProvider.notifier)
                                    .removeCategory(category);
                                category =
                                    category.getName.toLowerCase().capitalize();
                                categoryTags.add(category.getName);
                              }),
                        ))
                    .toList(),
              )
      ],
    );
  }
}
