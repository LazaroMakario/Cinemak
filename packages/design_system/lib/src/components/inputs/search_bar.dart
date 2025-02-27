import 'package:flutter/material.dart';
import '../../colors/app_colors.dart';
import '../../spacing/app_spacing.dart';
import '../../typography/app_typography.dart';

/// Barra de búsqueda personalizada para la aplicación Cinemak
class SearchBarInput extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onClear;
  final bool autofocus;
  final bool showClearButton;
  final EdgeInsetsGeometry? margin;

  const SearchBarInput({
    Key? key,
    this.controller,
    this.hintText = 'Buscar películas, actores, géneros...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.autofocus = false,
    this.showClearButton = true,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: AppSpacing.radiusMD,
        boxShadow: [
          if (!isDarkMode)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
        ],
      ),
      child: TextField(
        controller: controller,
        autofocus: autofocus,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        cursorColor: AppColors.primary,
        style: AppTypography.body2,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: controller != null && showClearButton && controller!.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller!.clear();
                    if (onClear != null) {
                      onClear!();
                    } else if (onChanged != null) {
                      onChanged!('');
                    }
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: AppSpacing.radiusMD,
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          filled: true,
          fillColor: isDarkMode 
              ? AppColors.backgroundCard 
              : Colors.grey.shade100,
        ),
      ),
    );
  }
}

/// Versión avanzada de la barra de búsqueda con funcionalidades adicionales como
/// filtros, historial de búsqueda, etc.
class AdvancedSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onClear;
  final VoidCallback? onFilterTap;
  final bool hasFilters;
  final List<String>? searchSuggestions;
  final Function(String)? onSuggestionSelected;

  const AdvancedSearchBar({
    Key? key,
    required this.controller,
    this.hintText = 'Buscar películas, actores, géneros...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onFilterTap,
    this.hasFilters = false,
    this.searchSuggestions,
    this.onSuggestionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: SearchBarInput(
                controller: controller,
                hintText: hintText,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                onClear: onClear,
              ),
            ),
            if (onFilterTap != null) ...[
              AppSpacing.horizontalSpacerXS,
              InkWell(
                onTap: onFilterTap,
                borderRadius: AppSpacing.radiusSM,
                child: Container(
                  padding: AppSpacing.paddingXS,
                  decoration: BoxDecoration(
                    color: hasFilters 
                        ? AppColors.primary 
                        : Theme.of(context).brightness == Brightness.dark 
                            ? AppColors.backgroundCard 
                            : Colors.grey.shade200,
                    borderRadius: AppSpacing.radiusSM,
                  ),
                  child: Icon(
                    Icons.filter_list,
                    color: hasFilters 
                        ? Colors.white 
                        : Theme.of(context).brightness == Brightness.dark 
                            ? Colors.white 
                            : Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ],
        ),
        
        // Sugerencias de búsqueda
        if (searchSuggestions != null && 
            searchSuggestions!.isNotEmpty && 
            controller.text.isNotEmpty) ...[
          AppSpacing.verticalSpacerXS,
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: AppSpacing.radiusMD,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchSuggestions!.length > 5 ? 5 : searchSuggestions!.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final suggestion = searchSuggestions![index];
                return ListTile(
                  dense: true,
                  leading: const Icon(Icons.history),
                  title: Text(
                    suggestion,
                    style: AppTypography.body2,
                  ),
                  onTap: () {
                    if (onSuggestionSelected != null) {
                      onSuggestionSelected!(suggestion);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
