module main

import bson
import mongo

fn main() {
	uri := 'mongodb://127.0.0.1:27017'
	mongo.initialize()
	
	mongo_uri := mongo.uri_new(uri)
	client := mongo.client_new_from_uri(mongo_uri)

	database := mongo.client_get_database(client, 'db_name')
	collection := mongo.client_get_collection(client, 'db_name', 'collection_name')
	
	bson_doc := bson.new()

	bson.init_from_json(bson_doc, '{"welcome": "to hell"}')
	
	// oid := &C.bson_oid_t{}

	// bson.oid_init(&oid)
	// bson.append_bool(bson1, 'bool', true)
	// // C.bson_append_utf8(bson, 'key3'.str,-1,'value',-1)
	// // C.bson_append_bool(bson, 'key2'.str,-1,true)

	// cursor := mongo.collection_find_with_opts(collection, bson1)

	// for mongo.cursor_next(cursor, &bson_doc) {
	// 	str := bson.as_canonical_extended_json(bson_doc)
	// 	mapp := json.decode(map[string], str)
	// }


	mongo.collection_insert_one(collection, bson_doc)
	
	

}