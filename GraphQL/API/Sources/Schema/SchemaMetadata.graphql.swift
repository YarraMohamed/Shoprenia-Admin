// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Shopify.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Shopify.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Shopify.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Shopify.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "AbandonedCheckout": return Shopify.Objects.AbandonedCheckout
    case "AbandonedCheckoutLineItem": return Shopify.Objects.AbandonedCheckoutLineItem
    case "Abandonment": return Shopify.Objects.Abandonment
    case "AddAllProductsOperation": return Shopify.Objects.AddAllProductsOperation
    case "AdditionalFee": return Shopify.Objects.AdditionalFee
    case "App": return Shopify.Objects.App
    case "AppCatalog": return Shopify.Objects.AppCatalog
    case "AppCredit": return Shopify.Objects.AppCredit
    case "AppInstallation": return Shopify.Objects.AppInstallation
    case "AppPurchaseOneTime": return Shopify.Objects.AppPurchaseOneTime
    case "AppRevenueAttributionRecord": return Shopify.Objects.AppRevenueAttributionRecord
    case "AppSubscription": return Shopify.Objects.AppSubscription
    case "AppUsageRecord": return Shopify.Objects.AppUsageRecord
    case "Article": return Shopify.Objects.Article
    case "BasicEvent": return Shopify.Objects.BasicEvent
    case "Blog": return Shopify.Objects.Blog
    case "BulkOperation": return Shopify.Objects.BulkOperation
    case "BusinessEntity": return Shopify.Objects.BusinessEntity
    case "CalculatedOrder": return Shopify.Objects.CalculatedOrder
    case "CartTransform": return Shopify.Objects.CartTransform
    case "CashTrackingAdjustment": return Shopify.Objects.CashTrackingAdjustment
    case "CashTrackingSession": return Shopify.Objects.CashTrackingSession
    case "CatalogCsvOperation": return Shopify.Objects.CatalogCsvOperation
    case "Channel": return Shopify.Objects.Channel
    case "ChannelDefinition": return Shopify.Objects.ChannelDefinition
    case "ChannelInformation": return Shopify.Objects.ChannelInformation
    case "CheckoutProfile": return Shopify.Objects.CheckoutProfile
    case "Collection": return Shopify.Objects.Collection
    case "Comment": return Shopify.Objects.Comment
    case "CommentEvent": return Shopify.Objects.CommentEvent
    case "Company": return Shopify.Objects.Company
    case "CompanyAddress": return Shopify.Objects.CompanyAddress
    case "CompanyContact": return Shopify.Objects.CompanyContact
    case "CompanyContactRole": return Shopify.Objects.CompanyContactRole
    case "CompanyContactRoleAssignment": return Shopify.Objects.CompanyContactRoleAssignment
    case "CompanyLocation": return Shopify.Objects.CompanyLocation
    case "CompanyLocationCatalog": return Shopify.Objects.CompanyLocationCatalog
    case "CompanyLocationStaffMemberAssignment": return Shopify.Objects.CompanyLocationStaffMemberAssignment
    case "ConsentPolicy": return Shopify.Objects.ConsentPolicy
    case "CookieBanner": return Shopify.Objects.CookieBanner
    case "Customer": return Shopify.Objects.Customer
    case "CustomerAccountAppExtensionPage": return Shopify.Objects.CustomerAccountAppExtensionPage
    case "CustomerAccountNativePage": return Shopify.Objects.CustomerAccountNativePage
    case "CustomerPaymentMethod": return Shopify.Objects.CustomerPaymentMethod
    case "CustomerSegmentMember": return Shopify.Objects.CustomerSegmentMember
    case "CustomerSegmentMembersQuery": return Shopify.Objects.CustomerSegmentMembersQuery
    case "CustomerVisit": return Shopify.Objects.CustomerVisit
    case "DeliveryCarrierService": return Shopify.Objects.DeliveryCarrierService
    case "DeliveryCondition": return Shopify.Objects.DeliveryCondition
    case "DeliveryCountry": return Shopify.Objects.DeliveryCountry
    case "DeliveryCustomization": return Shopify.Objects.DeliveryCustomization
    case "DeliveryLocationGroup": return Shopify.Objects.DeliveryLocationGroup
    case "DeliveryMethod": return Shopify.Objects.DeliveryMethod
    case "DeliveryMethodDefinition": return Shopify.Objects.DeliveryMethodDefinition
    case "DeliveryParticipant": return Shopify.Objects.DeliveryParticipant
    case "DeliveryProfile": return Shopify.Objects.DeliveryProfile
    case "DeliveryProfileItem": return Shopify.Objects.DeliveryProfileItem
    case "DeliveryPromiseParticipant": return Shopify.Objects.DeliveryPromiseParticipant
    case "DeliveryPromiseProvider": return Shopify.Objects.DeliveryPromiseProvider
    case "DeliveryProvince": return Shopify.Objects.DeliveryProvince
    case "DeliveryRateDefinition": return Shopify.Objects.DeliveryRateDefinition
    case "DeliveryZone": return Shopify.Objects.DeliveryZone
    case "DiscountAutomaticBxgy": return Shopify.Objects.DiscountAutomaticBxgy
    case "DiscountAutomaticNode": return Shopify.Objects.DiscountAutomaticNode
    case "DiscountCodeNode": return Shopify.Objects.DiscountCodeNode
    case "DiscountNode": return Shopify.Objects.DiscountNode
    case "DiscountRedeemCodeBulkCreation": return Shopify.Objects.DiscountRedeemCodeBulkCreation
    case "Domain": return Shopify.Objects.Domain
    case "DraftOrder": return Shopify.Objects.DraftOrder
    case "DraftOrderLineItem": return Shopify.Objects.DraftOrderLineItem
    case "DraftOrderTag": return Shopify.Objects.DraftOrderTag
    case "Duty": return Shopify.Objects.Duty
    case "ExchangeLineItem": return Shopify.Objects.ExchangeLineItem
    case "ExchangeV2": return Shopify.Objects.ExchangeV2
    case "ExternalVideo": return Shopify.Objects.ExternalVideo
    case "Fulfillment": return Shopify.Objects.Fulfillment
    case "FulfillmentConstraintRule": return Shopify.Objects.FulfillmentConstraintRule
    case "FulfillmentEvent": return Shopify.Objects.FulfillmentEvent
    case "FulfillmentHold": return Shopify.Objects.FulfillmentHold
    case "FulfillmentLineItem": return Shopify.Objects.FulfillmentLineItem
    case "FulfillmentOrder": return Shopify.Objects.FulfillmentOrder
    case "FulfillmentOrderDestination": return Shopify.Objects.FulfillmentOrderDestination
    case "FulfillmentOrderLineItem": return Shopify.Objects.FulfillmentOrderLineItem
    case "FulfillmentOrderMerchantRequest": return Shopify.Objects.FulfillmentOrderMerchantRequest
    case "GenericFile": return Shopify.Objects.GenericFile
    case "GiftCard": return Shopify.Objects.GiftCard
    case "GiftCardCreditTransaction": return Shopify.Objects.GiftCardCreditTransaction
    case "GiftCardDebitTransaction": return Shopify.Objects.GiftCardDebitTransaction
    case "Image": return Shopify.Objects.Image
    case "InventoryAdjustmentGroup": return Shopify.Objects.InventoryAdjustmentGroup
    case "InventoryItem": return Shopify.Objects.InventoryItem
    case "InventoryItemMeasurement": return Shopify.Objects.InventoryItemMeasurement
    case "InventoryLevel": return Shopify.Objects.InventoryLevel
    case "InventoryQuantity": return Shopify.Objects.InventoryQuantity
    case "LineItem": return Shopify.Objects.LineItem
    case "LineItemGroup": return Shopify.Objects.LineItemGroup
    case "Link": return Shopify.Objects.Link
    case "Location": return Shopify.Objects.Location
    case "MailingAddress": return Shopify.Objects.MailingAddress
    case "Market": return Shopify.Objects.Market
    case "MarketCatalog": return Shopify.Objects.MarketCatalog
    case "MarketRegionCountry": return Shopify.Objects.MarketRegionCountry
    case "MarketWebPresence": return Shopify.Objects.MarketWebPresence
    case "MarketingActivity": return Shopify.Objects.MarketingActivity
    case "MarketingEvent": return Shopify.Objects.MarketingEvent
    case "MediaImage": return Shopify.Objects.MediaImage
    case "Menu": return Shopify.Objects.Menu
    case "Metafield": return Shopify.Objects.Metafield
    case "MetafieldDefinition": return Shopify.Objects.MetafieldDefinition
    case "Metaobject": return Shopify.Objects.Metaobject
    case "MetaobjectDefinition": return Shopify.Objects.MetaobjectDefinition
    case "Model3d": return Shopify.Objects.Model3d
    case "OnlineStoreTheme": return Shopify.Objects.OnlineStoreTheme
    case "Order": return Shopify.Objects.Order
    case "OrderAdjustment": return Shopify.Objects.OrderAdjustment
    case "OrderDisputeSummary": return Shopify.Objects.OrderDisputeSummary
    case "OrderTransaction": return Shopify.Objects.OrderTransaction
    case "Page": return Shopify.Objects.Page
    case "PaymentCustomization": return Shopify.Objects.PaymentCustomization
    case "PaymentMandate": return Shopify.Objects.PaymentMandate
    case "PaymentSchedule": return Shopify.Objects.PaymentSchedule
    case "PaymentTerms": return Shopify.Objects.PaymentTerms
    case "PaymentTermsTemplate": return Shopify.Objects.PaymentTermsTemplate
    case "PriceList": return Shopify.Objects.PriceList
    case "PriceRule": return Shopify.Objects.PriceRule
    case "PriceRuleDiscountCode": return Shopify.Objects.PriceRuleDiscountCode
    case "Product": return Shopify.Objects.Product
    case "ProductBundleOperation": return Shopify.Objects.ProductBundleOperation
    case "ProductConnection": return Shopify.Objects.ProductConnection
    case "ProductDeleteOperation": return Shopify.Objects.ProductDeleteOperation
    case "ProductDuplicateOperation": return Shopify.Objects.ProductDuplicateOperation
    case "ProductFeed": return Shopify.Objects.ProductFeed
    case "ProductOption": return Shopify.Objects.ProductOption
    case "ProductOptionValue": return Shopify.Objects.ProductOptionValue
    case "ProductSetOperation": return Shopify.Objects.ProductSetOperation
    case "ProductTaxonomyNode": return Shopify.Objects.ProductTaxonomyNode
    case "ProductVariant": return Shopify.Objects.ProductVariant
    case "ProductVariantComponent": return Shopify.Objects.ProductVariantComponent
    case "Publication": return Shopify.Objects.Publication
    case "PublicationResourceOperation": return Shopify.Objects.PublicationResourceOperation
    case "QuantityPriceBreak": return Shopify.Objects.QuantityPriceBreak
    case "QueryRoot": return Shopify.Objects.QueryRoot
    case "Refund": return Shopify.Objects.Refund
    case "RefundShippingLine": return Shopify.Objects.RefundShippingLine
    case "Return": return Shopify.Objects.Return
    case "ReturnLineItem": return Shopify.Objects.ReturnLineItem
    case "ReturnableFulfillment": return Shopify.Objects.ReturnableFulfillment
    case "ReverseDelivery": return Shopify.Objects.ReverseDelivery
    case "ReverseDeliveryLineItem": return Shopify.Objects.ReverseDeliveryLineItem
    case "ReverseFulfillmentOrder": return Shopify.Objects.ReverseFulfillmentOrder
    case "ReverseFulfillmentOrderDisposition": return Shopify.Objects.ReverseFulfillmentOrderDisposition
    case "ReverseFulfillmentOrderLineItem": return Shopify.Objects.ReverseFulfillmentOrderLineItem
    case "SaleAdditionalFee": return Shopify.Objects.SaleAdditionalFee
    case "SavedSearch": return Shopify.Objects.SavedSearch
    case "ScriptTag": return Shopify.Objects.ScriptTag
    case "Segment": return Shopify.Objects.Segment
    case "SellingPlan": return Shopify.Objects.SellingPlan
    case "SellingPlanGroup": return Shopify.Objects.SellingPlanGroup
    case "ServerPixel": return Shopify.Objects.ServerPixel
    case "Shop": return Shopify.Objects.Shop
    case "ShopAddress": return Shopify.Objects.ShopAddress
    case "ShopPolicy": return Shopify.Objects.ShopPolicy
    case "ShopifyPaymentsAccount": return Shopify.Objects.ShopifyPaymentsAccount
    case "ShopifyPaymentsBalanceTransaction": return Shopify.Objects.ShopifyPaymentsBalanceTransaction
    case "ShopifyPaymentsBankAccount": return Shopify.Objects.ShopifyPaymentsBankAccount
    case "ShopifyPaymentsDispute": return Shopify.Objects.ShopifyPaymentsDispute
    case "ShopifyPaymentsDisputeEvidence": return Shopify.Objects.ShopifyPaymentsDisputeEvidence
    case "ShopifyPaymentsDisputeFileUpload": return Shopify.Objects.ShopifyPaymentsDisputeFileUpload
    case "ShopifyPaymentsDisputeFulfillment": return Shopify.Objects.ShopifyPaymentsDisputeFulfillment
    case "ShopifyPaymentsPayout": return Shopify.Objects.ShopifyPaymentsPayout
    case "ShopifyPaymentsVerification": return Shopify.Objects.ShopifyPaymentsVerification
    case "StaffMember": return Shopify.Objects.StaffMember
    case "StandardMetafieldDefinitionTemplate": return Shopify.Objects.StandardMetafieldDefinitionTemplate
    case "StoreCreditAccount": return Shopify.Objects.StoreCreditAccount
    case "StoreCreditAccountCreditTransaction": return Shopify.Objects.StoreCreditAccountCreditTransaction
    case "StoreCreditAccountDebitRevertTransaction": return Shopify.Objects.StoreCreditAccountDebitRevertTransaction
    case "StoreCreditAccountDebitTransaction": return Shopify.Objects.StoreCreditAccountDebitTransaction
    case "StoreCreditAccountExpirationTransaction": return Shopify.Objects.StoreCreditAccountExpirationTransaction
    case "StorefrontAccessToken": return Shopify.Objects.StorefrontAccessToken
    case "StringConnection": return Shopify.Objects.StringConnection
    case "SubscriptionBillingAttempt": return Shopify.Objects.SubscriptionBillingAttempt
    case "SubscriptionBillingCycleEditedContract": return Shopify.Objects.SubscriptionBillingCycleEditedContract
    case "SubscriptionContract": return Shopify.Objects.SubscriptionContract
    case "SubscriptionDraft": return Shopify.Objects.SubscriptionDraft
    case "TaxonomyAttribute": return Shopify.Objects.TaxonomyAttribute
    case "TaxonomyCategory": return Shopify.Objects.TaxonomyCategory
    case "TaxonomyChoiceListAttribute": return Shopify.Objects.TaxonomyChoiceListAttribute
    case "TaxonomyMeasurementAttribute": return Shopify.Objects.TaxonomyMeasurementAttribute
    case "TaxonomyValue": return Shopify.Objects.TaxonomyValue
    case "TenderTransaction": return Shopify.Objects.TenderTransaction
    case "TransactionFee": return Shopify.Objects.TransactionFee
    case "UnverifiedReturnLineItem": return Shopify.Objects.UnverifiedReturnLineItem
    case "UrlRedirect": return Shopify.Objects.UrlRedirect
    case "UrlRedirectImport": return Shopify.Objects.UrlRedirectImport
    case "Validation": return Shopify.Objects.Validation
    case "Video": return Shopify.Objects.Video
    case "WebPixel": return Shopify.Objects.WebPixel
    case "WebPresence": return Shopify.Objects.WebPresence
    case "WebhookSubscription": return Shopify.Objects.WebhookSubscription
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
