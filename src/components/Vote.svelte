<script lang="ts" context="module">
    export interface MovieData {
        movies: {
            id: number;
            name: string;
            img_url: string;
        };
    }
</script>

<script lang="ts">
    import { onMount } from "svelte";
    import type { User } from "@supabase/supabase-js";

    import supabase from "@config/supabase";

    export let moviesData: MovieData[];

    let votedMovie: number = 0;

    supabase.auth.onAuthStateChange((event, session) => {
        if (!session?.user) {
            votedMovie = 0;
        }
    });

    onMount(async () => {
        const {
            data: { session },
        } = await supabase.auth.getSession();

        getVotedMovie(session?.user);
    });

    async function getVotedMovie(user: User | undefined) {
        if (!user) {
            votedMovie = 0;
            return;
        }

        const { data } = await supabase
            .from("user_votes")
            .select("voted_movie")
            .eq("user_id", user.id)
            .maybeSingle();

        votedMovie = data?.voted_movie;
    }

    async function voteMovie(movie_id: number) {
        const {
            data: { session },
        } = await supabase.auth.getSession();

        if (!session?.user) {
            return;
        }

        votedMovie = movie_id;

        await supabase
            .from("user_votes")
            .upsert({ user_id: session.user.id, voted_movie: movie_id });

        await supabase.rpc("count_votes");
    }
</script>

<div class="vote-card-container">
    {#each moviesData as { movies: m }}
        <div
            class={votedMovie && votedMovie === m.id
                ? "vote-card-focused"
                : "vote-card"}
            style="background-image: url({m.img_url});"
        >
            <div class="card-gradient">
                <h2>
                    {m.name}
                </h2>
                {#if votedMovie && votedMovie === m.id}
                    <button class="vote-button">
                        <h2>Voted</h2>
                    </button>
                {:else}
                    <button
                        class="vote-button"
                        on:click={() => voteMovie(m.id)}
                    >
                        <h2>Vote</h2>
                    </button>
                {/if}
            </div>
        </div>
    {/each}
</div>

<style>
    h2 {
        margin: 0;
        font-family: Staatliches, sans-serif;
        color: white;
        transition: color 1s cubic-bezier(0.22, 1, 0.36, 1);
    }
    .vote-card-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(12ch, 1fr));
        gap: 1em;
    }
    .vote-card {
        display: flex;
        aspect-ratio: 1 / 1.25;
        background-color: white;
        background-size: 400%;
        border-radius: 0.6rem;
        background-size: cover;
        transition: 0.5s;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
            0 2px 4px -2px rgba(0, 0, 0, 0.1);
    }
    .vote-card:is(:hover) {
        background-position: bottom;
    }
    .vote-card:is(:hover) .card-gradient {
        background: #00000099;
    }
    .vote-card:is(:hover) .vote-button {
        display: block;
    }
    .vote-card-focused {
        display: flex;
        aspect-ratio: 1 / 1.25;
        background-color: white;
        background-size: 400%;
        border-radius: 0.6rem;
        background-size: cover;
        background-position: bottom;
        transition: 0.5s;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
            0 2px 4px -2px rgba(0, 0, 0, 0.1);
    }
    .vote-card-focused .card-gradient {
        background: #00000099;
    }
    .vote-card-focused .vote-button {
        display: block;
    }
    .card-gradient {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        width: 100%;
        line-height: 1.4;
        padding: 0.5rem 1rem;
        border: 0;
        border-radius: inherit;
        background: linear-gradient(180deg, #000000cc 10%, #ffffff00 50%);
    }
    .vote-button {
        display: none;
        background-color: #ffffff00;
        border: 1px solid white;
    }
    .vote-button:is(:hover) {
        background-color: rgba(255, 255, 255, 0.3);
    }
</style>
