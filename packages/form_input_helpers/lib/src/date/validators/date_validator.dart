import 'package:flutter/material.dart' show BuildContext, MaterialLocalizations;

/// Custom localised date validator
///
/// Given a range
/// and localised format
///
/// Split up functions with explicit parameters.
/// for conditional structures, patterns
///
/// For easier consolidation refactoring later.
/// /// paradigmatic? refactoring pass in coupling MaterialLocalizations directly vs
/// retaining convention of loosely querying BuildContext
///
/// Form.of vs globalkey
///
/// Do not get rid of parameters if doing
/// so would cause unwanted dependency between classes.
/// code smell long parameter lists
/// Do not replace parameter with method call in parent callee if we may need
/// it in the future.
/// Long parameter list decoupling verbosity
/// Can see duplicate code in the form of parameter lists.
///
/// Harder to maintain comprehensibility with longer lists
///
/// vs OOP retain the first states
///
/// Pass BuildContext vs MaterialLocalizations directly
class DateValidator {
  static DateTime? parse({
    required BuildContext localisedContext,
    String? text,
  }) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(localisedContext);

    return localizations.parseCompactDate(text);
  }

  static bool isDateValidAcceptable({
    DateTime? date,
    required DateTime minDateInclusive,
    required DateTime maxDateInclusive,
    bool Function(DateTime date)? isDateSelectable,
  }) {
    if (date == null) {
      return false;
    }

    final bool isWithinRangeInclusive = isDateWithinRange(
      date,
      minDateInclusive,
      maxDateInclusive,
    );

    final bool isSelectableWhenConfigured =
        (isDateSelectable == null || isDateSelectable(date));

    return isWithinRangeInclusive && isSelectableWhenConfigured;
  }

  static bool isDateWithinRange(
    DateTime date,
    DateTime minDateInclusive,
    DateTime maxDateInclusive,
  ) {
    return !date.isBefore(minDateInclusive) && !date.isAfter(maxDateInclusive);
  }

  /// Return null on success; error message on invalid.
  ///
  ///
  static String? validateDateErrorMessage({
    required BuildContext localisedContext,
    required DateTime date,
    required DateTime minDateInclusive,
    required DateTime maxDateInclusive,
    String? errorInvalidTextOverride,
  }) {
    if (!isDateValidAcceptable(
      date: date,
      minDateInclusive: minDateInclusive,
      maxDateInclusive: maxDateInclusive,
      isDateSelectable: null,
    )) {
      return errorInvalidTextOverride ??
          MaterialLocalizations.of(localisedContext).dateOutOfRangeLabel;
    }
    return null;
  }

  ///
  String? _validateDateText({
    required BuildContext localisedContext,
    String? text,
    required DateTime minDateInclusive,
    required DateTime maxDateInclusive,
    String? errorFormatTextOverride,
    String? errorInvalidTextOverride,
  }) {
    final DateTime? date = parse(
      localisedContext: localisedContext,
      text: text,
    );
    // Slightly confusing if-branching. Whether to exit error cases early
    // or null escape early.
    // Reverse convention with validators where null is the success message.
    //
    if (date == null) {
      // Do we handle invalid day month year inputs or silently wrap.
      // e.g. 0 = last day of the previous month.
      // 32 = extra days starting from the next month. 13 = next year january

      // A separate partial text checker function here?
      // Otherwise defaults to the invalid date format less-informative text.
      //

      return errorFormatTextOverride ??
          MaterialLocalizations.of(localisedContext).invalidDateFormatLabel;
    }

    // Superfluous code deduplication
    // Kept in case SDK changes in the future. Or if we contribute to library
    // Retain as many of same anchor points as possible.
    //
    // May be more maintainable to absorb validateDate into this text function
    final String? validateDateFormatRangeErrorMessage =
        validateDateErrorMessage(
      localisedContext: localisedContext,
      date: date,
      minDateInclusive: minDateInclusive,
      maxDateInclusive: maxDateInclusive,
      errorInvalidTextOverride: errorInvalidTextOverride,
    );
    if (validateDateFormatRangeErrorMessage != null) {
      return validateDateFormatRangeErrorMessage;
    }

    return null;
  }
}
