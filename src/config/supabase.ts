import { createClient } from "@supabase/supabase-js";

export default createClient(
    import.meta.env.PUBLIC_SUPABASE_API_URL,
    import.meta.env.PUBLIC_SUPABASE_ANON_KEY
);