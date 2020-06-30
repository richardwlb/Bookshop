using sap.capire.bookshop from '../db/schema';

service CatalogService @(path: '/browse') {
    @readonly entity Books as projection on bookshop.Books;
    @readonly entity Authors as projection on bookshop.Authors;
    @insertonly entity Orders as projection on bookshop.Orders;
}

annotate CatalogService.Books with @(
    UI.LineItem: [
       {$Type: 'UI.DataField', Value: ID},
       {$Type: 'UI.DataField', Value: title},
       {$Type: 'UI.DataField', Value: stock},
       {$Type: 'UI.DataField', Value: "author/name"},
    ],
    UI.HeaderInfo: {
        Title: { Value: title},
        TypeName: 'Book',
        TypeNamePlural: 'Books'
    }
);

annotate CatalogService.Authors with @(
    UI.LineItem:[
        { $Type: 'UI.DataField', Value: ID },
        { $Type: 'UI.DataField', Value: name },
    ],
    UI.HeaderInfo: {
        Title: { Value: title},
        TypeName: 'Authors',
        TypeNamePlural: 'Authors'
    }
);

