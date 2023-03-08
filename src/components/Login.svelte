<script lang="ts">
    import type { User } from "@supabase/supabase-js";
    import supabase from "@config/supabase";

    let user: User | undefined = undefined;

    supabase.auth.getSession().then(({ data }) => {
        user = data.session?.user;
    });

    async function signInWithDiscord() {
        await supabase.auth.signInWithOAuth({
            provider: "discord",
        });
    }

    async function signOut() {
        const { error } = await supabase.auth.signOut();
        if (!error) {
            user = undefined;
        }
    }
</script>

{#if user}
    <div class="instructions logged-in">
        <p class="text">
            Signed in as <span class="username">{user.user_metadata.name}</span
            >.
            <button on:click|once={signOut}>Logout</button>
        </p>
    </div>
{:else}
    <div class="instructions">
        <p class="text">
            Discord account is required to prevent spam and cast votes.
            <button on:click|once={signInWithDiscord}>Login</button>
        </p>
    </div>
{/if}

<style>
    button {
        padding: 0;
        border: 0;
        background: transparent;
        font-size: 1rem;
        text-decoration: underline;
        cursor: pointer;
    }
    .instructions {
        display: flex;
        flex-direction: column;
        line-height: 1.6;
        text-align: justify;
        margin: 1rem 0;
        background-color: white;
        padding: 0.05rem;
        border-radius: 0.4rem;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
            0 2px 4px -2px rgba(0, 0, 0, 0.1);
    }
    .logged-in {
        background-image: var(--accent-gradient);
        background-size: 400%;
        background-position: 0%;
    }
    .text {
        background-color: white;
        opacity: 0.8;
        border-radius: 0.35rem;
        padding: 0.69rem 1rem;
        margin: 0;
    }
    .text button {
        float: right;
        line-height: inherit;
    }
    .username {
        color: rgb(var(--accent));
    }
</style>
