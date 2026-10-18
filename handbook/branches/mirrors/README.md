# Mirrors

The branches the fork carries that are not its own, and the one copy that travels the other way.

**The fork's `main` is a mirror of `igraph/rigraph`'s `main`.**
The series is seeded from it, and the per-commit CI that runs in the fork compares against branches of the fork.
A mirror has one motion, it takes the canonical tip, by hard reset rather than merge,
so a commit pushed onto it in the fork is discarded on the next sync, and it is never a branch to work on.
The forward-port stage reads `main` from the canonical repository rather than from the mirror, because a mirror is behind for most of its cycle.

**The mechanism is the fork's own.**
The [Pull app](https://github.com/wei/pull) keeps it level, configured by [`.github/pull.yml`](/.github/pull.yml),
which is authored on the canonical `main` and read from the fork's default branch, a mirror of it.
Pull acts only on a fork object of the repository it follows, which is why `krlmlr/rigraph` is one.
It syncs every six hours, and creates no branch: a mirror is pushed once by hand and kept fresh afterwards.

**`<S>-green` travels the other way.**
r-universe reads ownership from the repository of the branch it builds,
so [`scripts/series-advance.sh`](/scripts/series-advance.sh) pushes every new `<S>-green` into `igraph/rigraph` beside the fork's,
as a plain push that git refuses unless it is a fast-forward; a refusal stops the firing rather than being forced.
