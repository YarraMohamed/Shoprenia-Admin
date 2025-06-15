// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// Possible error codes that can be returned by `DiscountUserError`.
public enum DiscountErrorCode: String, EnumType {
  /// The input value is blank.
  case blank = "BLANK"
  /// The input value needs to be blank.
  case present = "PRESENT"
  /// The input value should be equal to the value allowed.
  case equalTo = "EQUAL_TO"
  /// The input value should be greater than the minimum allowed value.
  case greaterThan = "GREATER_THAN"
  /// The input value should be greater than or equal to the minimum value allowed.
  case greaterThanOrEqualTo = "GREATER_THAN_OR_EQUAL_TO"
  /// The input value is invalid.
  case invalid = "INVALID"
  /// The input value should be less than or equal to the maximum value allowed.
  case lessThanOrEqualTo = "LESS_THAN_OR_EQUAL_TO"
  /// The input value should be less than the maximum value allowed.
  case lessThan = "LESS_THAN"
  /// The input value is already taken.
  case taken = "TAKEN"
  /// The input value is too long.
  case tooLong = "TOO_LONG"
  /// The input value is too short.
  case tooShort = "TOO_SHORT"
  /// Unexpected internal error happened.
  case internalError = "INTERNAL_ERROR"
  /// Too many arguments provided.
  case tooManyArguments = "TOO_MANY_ARGUMENTS"
  /// Missing a required argument.
  case missingArgument = "MISSING_ARGUMENT"
  /// The active period overlaps with other automatic discounts. At any given time, only 25 automatic discounts can be active.
  case activePeriodOverlap = "ACTIVE_PERIOD_OVERLAP"
  /// The end date should be after the start date.
  case endDateBeforeStartDate = "END_DATE_BEFORE_START_DATE"
  /// The value exceeded the maximum allowed value.
  case exceededMax = "EXCEEDED_MAX"
  /// Specify a minimum subtotal or a quantity, but not both.
  case minimumSubtotalAndQuantityRangeBothPresent = "MINIMUM_SUBTOTAL_AND_QUANTITY_RANGE_BOTH_PRESENT"
  /// The value is outside of the allowed range.
  case valueOutsideRange = "VALUE_OUTSIDE_RANGE"
  /// The attribute selection contains conflicting settings.
  case conflict = "CONFLICT"
  /// The value is already present through another selection.
  case implicitDuplicate = "IMPLICIT_DUPLICATE"
  /// The input value is already present.
  case duplicate = "DUPLICATE"
  /// The input value isn't included in the list.
  case inclusion = "INCLUSION"
  /// The `combinesWith` settings are invalid for the discount class.
  case invalidCombinesWithForDiscountClass = "INVALID_COMBINES_WITH_FOR_DISCOUNT_CLASS"
  /// The discountClass is invalid for the price rule.
  case invalidDiscountClassForPriceRule = "INVALID_DISCOUNT_CLASS_FOR_PRICE_RULE"
  /// The active period overlaps with too many other app-provided discounts. There's a limit on the number of app discounts that can be active at any given time.
  case maxAppDiscounts = "MAX_APP_DISCOUNTS"
  /// A discount cannot have both appliesOnOneTimePurchase and appliesOnSubscription set to false.
  case appliesOnNothing = "APPLIES_ON_NOTHING"
  /// Recurring cycle limit must be a valid integer greater than or equal to 0.
  case recurringCycleLimitNotAValidInteger = "RECURRING_CYCLE_LIMIT_NOT_A_VALID_INTEGER"
  /// Recurring cycle limit must be 1 when discount does not apply to subscription items.
  case multipleRecurringCycleLimitForNonSubscriptionItems = "MULTIPLE_RECURRING_CYCLE_LIMIT_FOR_NON_SUBSCRIPTION_ITEMS"
}
