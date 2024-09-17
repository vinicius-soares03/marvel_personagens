class Stories {
    int? available;
    String? collectionUri;
    List<StoriesItem>? items;
    int? returned;

    Stories({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

}

class StoriesItem {
    String? resourceUri;
    String? name;
    String? type;

    StoriesItem({
        this.resourceUri,
        this.name,
        this.type,
    });

}