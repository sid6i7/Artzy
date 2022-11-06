import 'package:frontend/services/database/artwork_utils.dart';
import 'package:frontend/services/database/gallery_utils.dart';

const BASE_URL = "http://127.0.0.1:8000/api/";

const USER_ENDPOINT = "users/";
const USER_EMAIL_ENDPOINT = "users/email/";
const USER_USERNAME_ENDPOINT = "users/username/";
const USER_PROFILE_ENDPOINT = "user-profiles/";

const GALLERY_ENDPOINT = "galleries/";
const ARTWORK_ENDPOINT = "artworks/";
const GALLERY_BY_OWNER_NAME_ENDPOINT = "gallery/owner/";
const SEARCH_ENDPOINT = "search/";

final genderMap = {
  'Prefer not to say': 'N',
  'Male': 'M',
  'Female': 'F',
  'Other': 'O',
};
